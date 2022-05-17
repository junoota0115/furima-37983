class Item < ApplicationRecord


  belongs_to :user
  has_one_attached :image

  validates :item_name, presence: true
  validates :content, presence: true
  validates :image, presence: true
  with_options presence:true,format: {with: /\A[0-9]+\z/ }do
  validates :price, numericality: {only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 },
  presence:{message: "can't be blank"}
end


  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :send_day

  validates :category_id, presence: true
  validates :item_status_id, presence: true
  validates :postage_id , presence: true
  validates :prefecture_id, presence: true
  validates :send_day_id, presence: true
  validates :price, presence: true
  validates :user, presence: true
     #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 0 , message:"can't be blank"} 
  validates :item_status_id, numericality: { other_than: 0 , message:"can't be blank"}
  validates :postage_id, numericality: { other_than: 0 , message:"can't be blank"}
  validates :prefecture_id, numericality: { other_than: 0 , message:"can't be blank"}
  validates :send_day_id, numericality: { other_than: 0 , message:"can't be blank"}
end
