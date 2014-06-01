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
    authorize! :manage, @patient
    @patient = Patient.find(params[:id])
  end

  def update
    authorize! :manage, @patient
    respond_to do |format|
      format.html do
        if @patient.update(patient_params)
          redirect_to @patient, notice: "#{@patient.firstname}'s details have been saved."
        else
          render action: 'new'
        end
      end

      format.json do
        @patient.update(patient_params)
        render json: @patient.to_json
      end
    end
  end

  private

  def patient_params
    params.require(:patient).permit(:firstname)
  end

end
