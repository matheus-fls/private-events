require 'rails_helper'

RSpec.describe Attendance, type: :model do

  let(:user) { User.create!(name:'Foobar', email:'foobar@bar.com')}

  let(:event) { Event.create!(name: 'Anything',description: 'Anything', 
                                date: Time.now + 1.month, user_id: user.id) }

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

end