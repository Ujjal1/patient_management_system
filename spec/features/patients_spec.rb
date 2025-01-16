require 'rails_helper'

RSpec.describe 'Patients Management', type: :feature do
  it 'allows a provider to create a new patient' do
    visit new_patient_path

    fill_in 'First name', with: 'John'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Email', with: 'john.doe@example.com'
    fill_in 'Next appointment date', with: '2025-01-15 10:00:00'

    click_button 'Create Patient'

    expect(page).to have_content('Patient was successfully created.')
    expect(page).to have_content('John Doe')
    expect(page).to have_content('john.doe@example.com')
  end

  it 'displays an error message for duplicate email' do
    create(:patient, email: 'duplicate@example.com')

    visit new_patient_path
    fill_in 'First name', with: 'Jane'
    fill_in 'Last name', with: 'Doe'
    fill_in 'Email', with: 'duplicate@example.com'
    click_button 'Create Patient'

    expect(page).to have_content('Email has already been taken')
  end
end
