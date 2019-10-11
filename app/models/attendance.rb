# frozen_string_literal: true

class Attendance < ApplicationRecord
  belongs_to :user
  belongs_to :event
  validates_uniqueness_of :user_id, scope: :event_id

  scope :upcoming_events, -> (user_id) { joins(:event).where('attendances.user_id = ? 
                                          and events.date >= ?', user_id, Date.today) }
  scope :past_events, -> (user_id) { joins(:event).where('attendances.user_id = ? 
                                          and events.date < ?', user_id, Date.today) }

end
