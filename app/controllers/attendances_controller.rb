class AttendancesController < ApplicationController
  def index
    @attendances = Attendances.all
  end

  def show
    @attendances = Attendances.find(params[:id])
  end

  def new
    @attendances = Attendances.new
  end

  def create
    @attendances = Attendances.new(params[:attendances])
    if @attendances.save
      redirect_to @attendances, :notice => "Successfully created attendances."
    else
      render :action => 'new'
    end
  end

  def edit
    @attendances = Attendances.find(params[:id])
  end

  def update
    @attendances = Attendances.find(params[:id])
    if @attendances.update_attributes(params[:attendances])
      redirect_to @attendances, :notice  => "Successfully updated attendances."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @attendances = Attendances.find(params[:id])
    @attendances.destroy
    redirect_to attendances_url, :notice => "Successfully destroyed attendances."
  end
end
