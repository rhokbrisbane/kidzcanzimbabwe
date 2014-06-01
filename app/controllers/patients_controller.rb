class PatientsController < ApplicationController
  load_and_authorize_resource

  def index
    if params[:q].present?
      @patients.where!("firstname ILIKE ? OR lastname ILIKE ?", "%#{params[:q]}%", "%#{params[:q]}%")
    end

    @patients.order!('LOWER(lastname)')
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

  def destroy
    @patient.destroy
    redirect_to patients_path
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
