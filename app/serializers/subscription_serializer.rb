class SubscriptionSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :description, :payment_date, :payment_interval_status,
             :cancel_page_link, :notified, :disabled, :created_at, :updated_at
end
