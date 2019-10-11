# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Attendance, type: :model do
  let(:user) { User.create!(name: 'Foobar', email: 'foobar@bar.com') }

  let(:event) do
    Event.create!(name: 'Anything', description: 'Anything',
                  date: Time.now + 1.month, user_id: user.id)
  end

  subject { Attendance.new }

  it 'is valid with valid attributes' do
    subject.user = user
    subject.event = event
    expect(subject).to be_valid
  end

  it 'is not valid without user' do
    subject.event = event
    expect(subject).to_not be_valid
  end

  it 'is not valid without event' do
    subject.user = user
    expect(subject).to_not be_valid
  end

  it 'is not valid create the same attendees' do
    attendance = Attendance.create!(user: user, event: event)
    expect(attendance).to be_valid
    subject.user = user
    subject.event = event
    expect(subject).to_not be_valid
  end
end
