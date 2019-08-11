class WorkerSerializer < ActiveModel::Serializer
  belongs_to :order
  attributes :id, :name, :company_name, :email, :order_id
end
