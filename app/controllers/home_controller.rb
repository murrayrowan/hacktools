class HomeController < ApplicationController
 
 def index
      @events = Event.all

      respond_to do |format|
        format.html # index.html.erb
      end
 end

end
