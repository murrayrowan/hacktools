class HomeController < ApplicationController
 
 def index
      @events = Event.find(:all, :conditions => [ "time < ?", Time.now ] )
      @past_events = Event.find(:all, :conditions => [ "time > ?", Time.now ] )
  
      respond_to do |format|
        format.html # index.html.erb
      end
 end

end
