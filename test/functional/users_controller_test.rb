require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  
  context "sign up" do
  
    should "show the new user page" do
      get :new
      assert assigns(:user)
      assert assigns(:user).new_record?
    end
    
    should "create a user when given valid parameters" do
      assert_difference "User.count", +1 do
        post :create, user: {firstname: 'Jane',
                             lastname: 'Doe',
                             email: 'jane@company.com',
                             password: 'catsanddogs',
                             password_confirmation: 'catsanddogs',
                             locale: 'en' }
        assert_response :redirect
        assert_redirected_to root_path
        assert flash[:notice]

        welcome_email = ActionMailer::Base.deliveries.last
        assert welcome_email
        assert_equal ['jane@company.com'], welcome_email.to
      end
    end
    
    should "not create a user when given invalid parameters" do
      assert_difference "User.count", 0 do
        post :create, user: {password: 'catsanddogs',
                             password_confirmation: 'catsanddogs'}
        assert_response :success
        assert_template :new
        assert assigns(:user)
        assert !assigns(:user).valid?
      end
    end

  end

  context "edit user settings" do
    setup do
      @user = Factory(:user)
      login_as(@user)
    end

    should "edit user" do
      get :edit, id: @user.id

      assert_response :success
      assert assigns(:user)
      assert_equal assigns(:user), @user
    end

    should "update user with valid parameters" do
      put :update, id: @user.id, user: { locale: 'en' }

      assert_response :redirect
      assert_redirected_to root_path
      assert flash[:notice]
    end

    should "update user with invalid parameters" do
      put :update, id: @user.id, user: {locale: 'invalid'}
      assert_response :success
      assert assigns(:user)
      assert assigns(:user).changed?
      assert_template :edit
    end

  end

end
