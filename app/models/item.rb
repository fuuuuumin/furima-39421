class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipment
  has_one_attached :image

  validates :name, presence: true
  validates :description, presence: true
  validates :image, presence: true
  validates :price, presence: true,
                    numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '¥300~¥9,999,999で指定してください' }, format: { with: /\A[0-9]+\z/, message: '半角数字で入力して下さい。' }
  validates :category_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :condition_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :postage_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :prefecture_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
  validates :shipment_id, presence: true, numericality: { other_than: 1, message: "can't be blank" }
end
