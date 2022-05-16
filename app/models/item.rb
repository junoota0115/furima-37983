class Item < ApplicationRecord

  belongs_to :user

  validates :item_name, presence: true
  validates :content, presence: true
  validates :category_id, presence: true
  validates :item_status_id, presence: true
  validates :postage_id , presence: true
  validates :prefecture_id, presence: true
  validates :send_day_id, presence: true
  validates :price, presence: true
  validates :user, presence: true
end
