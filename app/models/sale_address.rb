class SaleAddress
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :municipalities, :street_address, :building, :telephone_number, :user_id, :item_id

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :prefecture_id
    validates :municipalities
    validates :street_address
    validates :telephone_number, format: {with: /\A\d{10,11}\z/, message: "10桁以上11桁以内の半角数値で入力してください" }
  end

  def save
    sale = Sale.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, prefecture_id: prefecture_id, municipalities: municipalities, street_address: street_address, building: building, telephone_number: telephone_number, sale_id: sale.id)
  end
end