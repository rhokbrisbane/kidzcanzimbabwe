class PatientsController < ApplicationController
  load_and_authorize_resource

  def index
    @patients = @patients.order('patients.lastname')
  end

  def edit
    @address = @patient.address
  end

  def show
  end

  def new
  end

  def create
    @patient = Patient.new patient_params

    if @patient.save
      @patient.create_address address_params
      redirect_to @patient, notice: 'Patient was successfully created.'
    else
      flash.now[:alert] = @patient.errors.full_messages.to_sentence
      render action: 'new'
    end
  end

  def update
    @address = @patient.build_address || @patient.address

    if @patient.update(patient_params) && @address.update(address_params)
      redirect_to @patient, notice: 'Patient was successfully updated.'
    else
      flash.now[:alert] = @patient.errors.full_messages.to_sentence
      render action: 'edit'
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:firstname, :lastname, :sex, :date_of_birth,
      :date_of_death, :kidzcan_number,:kidzcan_registration, :diagnosis,
      :point_of_contact, :mobile_number)
  end

  def address_params
    params.require(:address).permit(:street1, :suburb, :state, :country)
  end

end
