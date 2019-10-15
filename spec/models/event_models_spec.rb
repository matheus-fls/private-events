# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  let(:user) { User.create!(name: 'Foobar', email: 'foobar@bar.com') }

  subject do
    Event.create!(name: 'Anything', description: 'Anything',
                  date: Time.now + 1.month, user_id: user.id)
  end

  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'a user can have more than one event' do
    event1 = Event.create!(name: 'Anything1', description: 'Anything1',
                           date: Time.now + 1.month, user_id: user.id)
    event2 = Event.create!(name: 'Anything2', description: 'Anything2',
                           date: Time.now + 2.month, user_id: user.id)

    expect(user.reload.events).to eq([event1, event2])
  end

  it 'is not valid without a description' do
    subject.description = ''
    expect(subject).to_not be_valid
  end

  it 'is not valid without a date' do
    subject.date = nil
    expect { subject.valid? }.to raise_error(NoMethodError)
  end

  it 'is not valid without an user id' do
    subject.user_id = nil
    expect(subject).to_not be_valid
  end
end
