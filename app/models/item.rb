class Item < ApplicationRecord


  belongs_to :user


   #has_one_attached :image　後でチェック

  validates :item_name, presence: true
  validates :content, presence: true
  validates :category_id, presence: true
  validates :item_status_id, presence: true
  validates :postage_id , presence: true
  validates :prefecture_id, presence: true
  validates :send_day_id, presence: true
  validates :price, presence: true
  validates :user, presence: true

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :item_status
     #ジャンルの選択が「--」の時は保存できないようにする
  validates :category_id, numericality: { other_than: 1 , message:"can't be blank"} 
  validates :item_status_id, numericality: { other_than: 1 , message:"can't be blank"}

end
