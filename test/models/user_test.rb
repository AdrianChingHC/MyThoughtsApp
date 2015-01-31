require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(name: "User", email: "user@mythoughtsapp.com")
  end

  test "should be valid" do
  	assert @user.valid?
  end

  test "name should be present" do
  	@user.name = "   "
  	assert_not @user.valid?
  end

  test "name should not be too long" do
  	@user.name = "a" * 51
  	assert_not @user.valid?
  end

  test "email should be present" do
  	@user.email = "    "
  	assert_not @user.valid?
  end

  test "email should not be too long" do
  	@user.email = "a" * 238 + "@mythoughtsapp.com"
  	assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
  	valid_addresses = %w[user@mythoughtsapp.com USER@mythoughtsapp.COM I_AM-USER@my.thoughtsapp.net last.name@app.jp user+name@mythoughtsapp.cn]
  	valid_addresses.each do |v|
  		@user.email = v
  		assert @user.valid?, "#{v.inspect} should be valid"
  	end
  end
end
