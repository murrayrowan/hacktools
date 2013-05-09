class AttendancesController < ApplicationController
  def index
    @events = Event.joins(:attendances).where('user_id = ?', params[:user_id])
  end

  def show
    @attendances = Attendance.find(params[:user_id])
  end

  def new
    @attendances = Attendances.new
  end

  def create
    @attendances = Attendance.new(:user_id => params[:user_id], :event_id => params[:event_id])
    if @attendances.save
      redirect_to :back, :notice => "You have been successfully REGISTERED for this event."
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
    @attendances = Attendance.find(params[:id])
    @attendances.destroy
    redirect_to :back, :notice => "You have been successfully UNREGISTERED from this event."
    rescue ActionController::RedirectBackError
      redirect_to root_path, :notice => "You have been successfully UNREGISTERED from the event."
  end
end
