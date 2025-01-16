require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns all patients to @patients' do
      create_list(:patient, 3)
      get :index
      expect(assigns(:patients).count).to eq(3)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new patient' do
        expect {
          post :create, params: { patient: attributes_for(:patient) }
        }.to change(Patient, :count).by(1)
      end

      it 'redirects to the index page' do
        post :create, params: { patient: attributes_for(:patient) }
        expect(response).to redirect_to(patients_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not create a new patient' do
        expect {
          post :create, params: { patient: attributes_for(:patient, email: nil) }
        }.to_not change(Patient, :count)
      end

      it 'renders the new template' do
        post :create, params: { patient: attributes_for(:patient, email: nil) }
        expect(response).to render_template(:new)
      end
    end
  end
end
