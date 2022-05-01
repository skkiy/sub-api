require "test_helper"

class SubscriptionTest < ActiveSupport::TestCase
  def setup
    @michael = users('michael')
    @subscription = Subscription.new(
      name: "example",
      price: 100,
      payment_date: Date.today,
      payment_interval_status: 'month',
      user: @michael
    )
  end

  test "valid" do
    assert @subscription.valid?
  end

  test "invalid name" do
    @subscription.name = "  "
    assert_not @subscription.valid?
    @subscription.name = "a" * 101
    assert_not @subscription.valid?
  end

  test "invalid price" do
    @subscription.price = nil
    assert_not @subscription.valid?
  end

  test "invalid description" do
    @subscription.description = "a" * 1001
    assert_not @subscription.valid?
  end

  test "invalid payment_date" do
    @subscription.payment_date = nil
    assert_not @subscription.valid?
  end

  test "invalid payment_status" do
    @subscription.payment_interval_status = nil
    assert_not @subscription.valid?
    @subscription.payment_interval_status = 'unknown'
    assert_not @subscription.valid?
  end
end
