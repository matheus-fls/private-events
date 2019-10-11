# frozen_string_literal: true

class Event < ApplicationRecord
  has_many :attendances
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  has_many :attendees, class_name: 'User', through: :attendances

  validates :name, presence: true
  validates :description, presence: true
  validates :date, presence: true
  validate :future_event

  private

  def future_event
    errors.add(:date, "Can't be in the past!") if date.past?
  end
end
