Before('@LoggedIn') do |scenario|
  user = FactoryGirl.create(:registered_user)
  login_as(user, scope: :user)
  Warden.test_mode!
end

After('@LoggedIn') do |scenario|
  logout(:user)
  Warden.test_reset!
end
