require "test_helper"

class UserTest < ActiveSupport::TestCase
  def setup
    @user = User.new(
      name: "example",
      email: "user@example.com",
      password: "password"
    )
  end

  test "valid" do
    assert @user.valid?
  end

  test "invalid name" do
    @user.name = "  "
    assert_not @user.valid?
    @user.name = "a" * 51
    assert_not @user.valid?
  end

  test "invalid email" do
    @user.email = "   "
    assert_not @user.valid?
    @user.email = "test"
    assert_not @user.valid?
    @user.email = "a" * 255 + "@example.com"
    assert_not @user.valid?
  end
end
