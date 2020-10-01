class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :gender

  devise  :database_authenticatable, :registerable,
          :recoverable, :rememberable, :validatable

  VALID_email_REGEX = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i.freeze
  VALID_password_REGEX = /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]{6,100}\z/i.freeze

  with_options presence: true do
    validates :nickname
    validates :email, format: { with: VALID_email_REGEX }
    validates :password, format: { with: VALID_password_REGEX }
    validates :birthday
    validates :gender_id, numericality: { other_than: 1 } 
  end


  has_many :things

end
