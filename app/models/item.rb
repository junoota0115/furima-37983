class Item < ApplicationRecord


  belongs_to :user
  has_one    :order
  has_one_attached :image

  with_options presence: true do
  validates :item_name
  validates :content
  validates :image
  validates :category_id
  validates :item_status_id
  validates :postage_id 
  validates :prefecture_id
  validates :send_day_id
  validates :user
  end

  with_options presence:true,format: {with: /\A[0-9]+\z/ }do
  validates :price, numericality: {only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }
end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :send_day



  validates :category_id, numericality: { other_than: 0 , message:"can't be blank"} 
  validates :item_status_id, numericality: { other_than: 0 , message:"can't be blank"}
  validates :postage_id, numericality: { other_than: 0 , message:"can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message:"can't be blank"}
  validates :send_day_id, numericality: { other_than: 0 , message:"can't be blank"}
end
