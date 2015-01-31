require 'test_helper'

class UserSignupTest < ActionDispatch::IntegrationTest
  # test "the truth" do
  #   assert true
  # end
  test "invalid signup information" do
  	get signup_path
  	assert_no_difference 'User.count' do
  		post users_path, user: { name: "",
  														 email: "user@mythoughtapp",
  														 password: "pass",
  														 password_confirmation: "word"}
  	end
  	assert_template 'users/new'
  end
end
