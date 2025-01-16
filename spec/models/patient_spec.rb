require 'rails_helper'

RSpec.describe Patient, type: :model do
  describe 'validations' do
    it 'is valid with valid attributes' do
      patient = build(:patient)
      expect(patient).to be_valid
    end

    it 'is invalid without a first name' do
      patient = build(:patient, first_name: nil)
      expect(patient).to_not be_valid
    end

    it 'is invalid without a last name' do
      patient = build(:patient, last_name: nil)
      expect(patient).to_not be_valid
    end

    it 'is invalid without an email' do
      patient = build(:patient, email: nil)
      expect(patient).to_not be_valid
    end

    it 'is invalid with a duplicate email' do
      create(:patient, email: 'test@example.com')
      patient = build(:patient, email: 'test@example.com')
      expect(patient).to_not be_valid
    end
  end
end
