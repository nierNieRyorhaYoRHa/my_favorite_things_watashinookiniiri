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
    return false if invalid?

    thing = Thing.new(
      name: name, 
      explanation: explanation, 
      score: score, 
      date: date, 
      price: price, 
      user_id: user_id, 
      image: image
    )

    thing.save

    tag = Tag.where(tagname: tagname).first_or_initialize
    tag.save
    ThingTagRelation.create(thing_id: thing.id, tag_id: tag.id)
  end

  def find
    @thing = Thing.find(params[:id])
  end

  def update (thing_params)
    return false if invalid?
    thing = Thing.find(thing_id)

    thing.name = name
    thing.explanation = explanation
    thing.score = score
    thing.date = date
    thing.price = price
    thing.image = image

    thing.save
    
    tag = Tag.where(tagname: tagname).first_or_initialize
    tag.save
    ThingTagRelation.create(thing_id: thing.id, tag_id: tag.id)
  end

end