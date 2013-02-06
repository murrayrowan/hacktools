class HomeController < ApplicationController
 
 def index
      @hackers = Hacker.all
      @hacks = Hack.all
      @teams = Team.all
      @events = Event.all

      respond_to do |format|
        format.html # index.html.erb
      end
 end

end
