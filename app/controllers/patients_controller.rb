class PatientsController < ApplicationController
  load_and_authorize_resource

  def index
    if params[:q].present?
      @patients.where!("firstname ILIKE ? OR lastname ILIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    end

    @patients.order!('patients.lastname')
  end

  def csv
    file = "#{Rails.root}/tmp/patients_#{Time.now.to_i}.csv"

    CSV.open(file, 'w') do |csv|
      csv << %w(id kidzcan_number hospital_ref_number firstname lastname sex date_of_birth date_of_death kidzcan_registration mobile_number status point_of_contact diagnosis created_at updated_at)

      @patients.each do |patient|
        csv << patient.slice(:id, :kidzcan_number, :hospital_ref_number, :firstname, :lastname, :sex, :date_of_birth, :date_of_death, :kidzcan_registration, :mobile_number, :status, :point_of_contact, :diagnosis, :created_at, :updated_at).values
      end
    end

    send_file(file)
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
    params.require(:patient).permit(:firstname)
  end
end
