class PatientsController < ApplicationController
  
  def index
    authorize! :read, @patients
    @patients = Patient.all
  end

  def show
    authorize! :read, @patient
    @patient = Patient.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
    @patient = Patient.find(params[:id])
    authorize! :manage, @patient
  end

  def update
    
  end

  private

  def patient_params
    params.require(:patient).permit(:firstname)
  end

end
