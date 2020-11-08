class Tag < ApplicationRecord

  has_many :thing_tag_relations
  has_many :things, through: :thing_tag_relations

end
