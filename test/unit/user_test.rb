require 'test_helper'

class UserTest < ActiveSupport::TestCase

  context "user instance" do
    
    subject { Factory(:user) }
    
    should validate_presence_of   :email
    should validate_uniqueness_of :email

    should validate_presence_of   :firstname
    should validate_presence_of   :lastname

    %w(en fi).each do |v|
      should allow_value(v).for(:locale)
    end

    should_not allow_value("invalid").for(:locale)
  end
  
end
