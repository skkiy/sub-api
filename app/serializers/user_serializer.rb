class UserSerializer < ActiveModel::Serializer
  attributes :id, :name
  attribute :email, if: -> { instance_options[:target_is_me] }
end
