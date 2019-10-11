# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AttendanceController do
  let(:user) { User.create!(name: 'Foobar', email: 'foobar@bar.com') }

  let(:event) do
    Event.create!(name: 'Anything', description: 'Anything',
                  date: Time.now + 1.month, user_id: user.id)
  end

  describe 'Create new attendance' do
    it 'Create a valid attendance' do
      @attendance = Attendance.new(user: user, event: event)
      expect(@attendance).to be_valid
    end
  end
end
