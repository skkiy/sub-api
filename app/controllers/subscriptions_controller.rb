class SubscriptionsController < ApplicationController
  before_action :authenticate_user!

  def create
    @subscription = current_user.subscriptions.build(subscription_params)
    if @subscription.save
      render status: :created, json: {
        data: {
          subscription: @subscription
        }
      }
    else
      render status: :bad_request, json: { errors: @subscription.errors }
    end
  end

  def update
    @subscription = Subscription.where(user_id: current_user.id).find(params[:id])
    if @subscription.update(subscription_params)
      render status: :ok, json: {
        data: {
          subscription: SubscriptionSerializer.new(@subscription).as_json
        }
      }
    else
      render status: :bad_request, json: { errors: @subscription.errors }
    end
  end

  def index
    @subscriptions = Subscription.where(user_id: current_user.id).order(:created_at)
    results = ActiveModelSerializers::SerializableResource.new(
      @subscriptions,
      each_serializer: SubscriptionSerializer,
    ).as_json
    render status: :ok, json: {
      data: {
        count: @subscriptions.count,
        results: results,
      }
    }
  end

  def show
    @subscription = Subscription.where(user_id: current_user.id).find(params[:id])
    render status: :ok, json: {
      data: {
        subscription: SubscriptionSerializer.new(@subscription).as_json,
      }
    }
  end

  def destroy
    Subscription.delete(params[:id])
    render status: :no_content
  end

  private

  def subscription_params
    params.require(:subscription).permit(
      :name, :price, :description, :payment_date,
      :payment_interval_status, :cancel_page_link, :notified, :disabled
    )
  end
end
