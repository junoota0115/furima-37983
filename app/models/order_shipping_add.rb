class OrderShippingAdd
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefecture_id, :city, :address, :building,:phone_number,:token


with_options presence: true do
  # orderモデルのバリデーション
  validates :user_id
  validates :item_id
  # shipping_addモデルのバリデーション
  validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: "半角の(-)を入れてください" }
  validates :prefecture_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :city
  validates :address
  validates :phone_number, format: { with: /\A[0-9]{11}\z/, message: "数字のみ正しく入力してください" }
  # トークンのバリデーション
  validates :token
end

  
  def save
    order = Order.create( user_id: user_id,item_id: item_id)
    ShippingAdd.create(order_id: order.id, postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number:phone_number)
  end


end