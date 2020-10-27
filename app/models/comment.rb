class Comment < ApplicationRecord
  with_options presence: true do
    validates :text
    validates :user_id
  end

  belongs_to :thing
  belongs_to :user
end
