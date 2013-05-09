class HomeController < ApplicationController
 
 def index
      @events = Event.find(:all, :conditions => [ "event_date > ?", Date.today ] )
      @past_events = Event.find(:all, :conditions => [ "event_date < ?", Date.today ] )
  	  @attendances = Attendance.where("user_id = ?", current_user.id) if current_user
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @events }
      end
 end

end
