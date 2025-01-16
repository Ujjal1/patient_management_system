class PatientsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_patient, only: %i[show edit update destroy]

  def index
    @patients = Patient.where(user: current_user)
                       .order(:last_name)
                       .page(params[:page])
    @patients = @patients.where('next_appointment <= ?', 72.hours.from_now) if params[:soon].present?
    @patients = @patients.where('first_name ILIKE :query OR last_name ILIKE :query OR email ILIKE :query', query: "%#{params[:search]}%") if params[:search].present?
  end

  def new
    @patient = Patient.new
  end

  def create
    @patient = current_user.patients.new(patient_params)
    if @patient.save
      redirect_to patients_path, notice: 'Patient created successfully.'
    else
      flash.now[:alert] = @patient.errors.full_messages.to_sentence
      render :new
    end
  end

  def edit; end

  def update
    if @patient.update(patient_params)
      redirect_to patients_path, notice: 'Patient updated successfully.'
    else
      flash.now[:alert] = @patient.errors.full_messages.to_sentence
      render :edit
    end
  end

  def destroy
    @patient.destroy
    redirect_to patients_path, notice: 'Patient deleted successfully.'
  end

  private

  def set_patient
    @patient = current_user.patients.find(params[:id])
  end

  def patient_params
    params.require(:patient).permit(:first_name, :last_name, :email, :next_appointment)
  end
end
