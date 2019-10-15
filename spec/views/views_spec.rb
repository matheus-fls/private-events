# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Users', type: :feature do
  scenario 'show page' do
    visit root_path
    expect(page).to have_content('Events')
  end

  scenario 'show sign up page' do
    visit signup_path
    expect(page).to have_button('Sign up')
    expect(page).to have_field('Name')
    expect(page).to have_field('Email')
  end
end
