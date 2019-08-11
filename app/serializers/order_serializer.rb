class OrderSerializer < ActiveModel::Serializer
  has_many :workers
  attributes :id, :title, :description, :deadline
end
