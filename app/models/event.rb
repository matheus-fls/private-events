# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :attendances
  belongs_to :creator, class_name: 'User'
  has_many :attendees, class_name: 'User', through: :attendances

  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validate :past_event

  scope :upcoming_events, -> { where('events.date >= ?', Date.today) }
  scope :past_events, -> { where('events.date < ?', Date.today) }

  private

  def past_event
    errors.add(:date, "Can't be in the past!") if date&.< Date.today
  end
end
