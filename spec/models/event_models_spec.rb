# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Event, type: :model do
  subject { Event.new }

  it 'is valid with valid attributes' do
    subject.name = 'Anything'
    subject.description = 'Anything'
    subject.date = DateTime.now + 1.month
    subject.user_id = 1
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    expect(subject).to_not be_valid
  end

  it 'is not valid without a description' do
    subject.name = 'Anything'
    expect(subject).to_not be_valid
  end

  it 'is not valid without a start_date' do
    subject.name = 'Anything'
    subject.description = 'Lorem ipsum dolor sit amet'
    expect(subject).to_not be_valid
  end

  it 'is not valid without a end_date' do
    subject.name = 'Anything'
    subject.description = 'Lorem ipsum dolor sit amet'
    subject.date = DateTime.now
    expect(subject).to_not be_valid
  end
end
