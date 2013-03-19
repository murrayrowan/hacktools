class HomeController < ApplicationController
 
 def index
      @events = Event.find(:all, :conditions => [ "event_date > ?", Date.today ] )
      @past_events = Event.find(:all, :conditions => [ "event_date < ?", Date.today ] )
  
      respond_to do |format|
        format.html # index.html.erb
        format.json { render json: @events }
      end
 end

end
