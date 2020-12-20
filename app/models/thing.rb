class Thing < ApplicationRecord

  # with_options presence: true do
  #   validates :image
  #   validates :name
  #   validates :explanation
  #   validates :price
  #   validates :score
  #   validates :date
  # end

  belongs_to :user
  has_one_attached :image
  has_many :comments
  has_many :thing_tag_relations
  has_many :tags, through: :thing_tag_relations

  def self.search(search)
    if search != ""
      Thing.where('name LIKE(?) OR explanation LIKE(?)', "%#{search}%", "%#{search}%")
    else
      Thing.all
    end
  end

end
