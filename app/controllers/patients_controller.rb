class PatientsController < ApplicationController
  
  def index
    authorize! :read, @patients
    @patients = Patient.all
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end
end
