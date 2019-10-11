# frozen_string_literal: true

class Event < ApplicationRecord
  has_many   :attendances
  belongs_to :creator,   class_name: 'User', foreign_key: 'user_id'
  has_many   :attendees, class_name: 'User', through: :attendances

  validates :name,        presence: true
  validates :description, presence: true
  validates :date,        presence: true
  validate  :future_event

  scope :upcoming_events, -> (user_id) { where(["date >= ? and user_id = ?", 
                                                 Date.today, user_id]) }
  scope :past_events    , -> (user_id) { where("date <  ?", Date.today) &&
                                         where("user_id = ?", user_id) }                                 

  private

  def future_event
    errors.add(:date, "Can't be in the past!") if date < Date.today
  end
end
