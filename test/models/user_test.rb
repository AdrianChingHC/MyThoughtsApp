require 'test_helper'

class UserTest < ActiveSupport::TestCase
  def setup
  	@user = User.new(name: "User", email: "user@mythoughtsapp.com", password: "password", password_confirmation: "password")
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

  test "email validation should reject invalid addresses" do
  	invalid_addresses = %w[user@mythoughtsapp,com user.first@mythoughtsapp. user@my_thoughtsapp.com user@my+thoughtsapp.com my_name-is_user.org user@mythoughtsapp..com]
  	invalid_addresses.each do |i|
  		@user.email = i
  		assert_not @user.valid?, "#{i.inspect} should not be valid"
  	end
  end

  test "email addresses should be unique" do
  	duplicate_user = @user.dup
  	duplicate_user.email = @user.email.upcase
  	@user.save
  	assert_not duplicate_user.valid?
  end

  test "password should not be too short" do
  	@user.password = @user.password_confirmation = "a" * 7
  	assert_not @user.valid?
  end
end
