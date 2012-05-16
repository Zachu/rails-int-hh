# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  sequence :email do |n|
    "info#{n}@eficode.fi"
  end
  
  factory :user do
    email
    password 'infopass'
    locale 'en'
    firstname 'Tuomas'
    lastname 'Korhonen'
    image 'http://www.goat.cx/hello.jpg'
    birthday '1987-06-7'
    phone '050505050'
    address 'Haapaniementie 7 A 11, 00200 Moskova'
    description 'Kuvaus'
  end
  
end
