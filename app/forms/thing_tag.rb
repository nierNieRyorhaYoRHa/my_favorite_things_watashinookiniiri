class ThingTag
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  attr_accessor :thing_id, :user_id, :name, :explanation, :price, :score, :date, :tagname, :image

  with_options presence: true do
    validates :image
    validates :name
    validates :explanation
    validates :price
    validates :score
    validates :date
  end

  def save
    thing = Thing.create(
      name: name, 
      explanation: explanation, 
      score: score, 
      date: date, 
      price: price, 
      user_id: user_id, 
      image: image)
    tag = Tag.where(tagname: tagname).first_or_initialize
    tag.save
    ThingTagRelation.create(thing_id: thing.id, tag_id: tag.id)
  end

end