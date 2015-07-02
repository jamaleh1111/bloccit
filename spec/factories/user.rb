FactoryGirl.define do 
  factory :user do
    email 'test@example.com'
    password 'f4k3p455w0rd'
    user = FactoryGirl.create(:user)
    user.confirmed_at = Time.now
    user.save

  RSpec.configure do |config|
    config.after :each do
      Warden.test_reset!
    end
  end 
end