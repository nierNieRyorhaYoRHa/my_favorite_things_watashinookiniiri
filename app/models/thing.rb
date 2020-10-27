class Thing < ApplicationRecord

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price
    validates :score
    validates :date
  end


  belongs_to :user
  has_one_attached :image
  has_many :comments


end
