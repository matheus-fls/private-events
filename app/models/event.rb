class Event < ApplicationRecord
  has_many :attendances
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :attendees, class_name: 'User', through: :attendances
end
