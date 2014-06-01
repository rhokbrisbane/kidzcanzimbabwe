class PatientsController < ApplicationController
  load_and_authorize_resource

  def index
    @patients = @patients.order('patients.lastname')
  end

  def edit
  end

  def show
  end

  def new
  end

  def create
  end

  def update
    if @patient.update(patient_params)# && @address.update(address_params)
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

end
