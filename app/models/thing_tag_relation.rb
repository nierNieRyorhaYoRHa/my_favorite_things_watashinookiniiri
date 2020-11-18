class ThingTagRelation < ApplicationRecord

  belongs_to :thing
  belongs_to :tag

end
