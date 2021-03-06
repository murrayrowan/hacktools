class TeamsController < ApplicationController
  # GET /teams
  # GET /teams.json
  def index
  @event = Event.find(params[:id])
  
   if params[:tag]
      
    # this needs to be limited to teams in specific event
    # although tags are not set upfor teams yet
    @teams = Team.tagged_with(params[:tag])
	    
   elsif params[:id]

   @teams = Team.where(:event_id => params[:id])
   @attendances = Attendance.where("user_id = ?", current_user.id) if current_user 

   # select * from teams where id in (select team_id from events_hackers_hacks_teams where event_id = 1); 
   # @teams = Team.where(id: EventsHackersHacksTeams.select("team_id").where(event_id: params[:id]))
		      
   else
			  
    @teams = Team.all
		
   end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @teams }
    end
  end

  # GET /teams/1
  # GET /teams/1.json
  def show
    @team = Team.find(params[:team_id])
    @event = Event.find(params[:id])
    @hacks = Hack.joins(:team).where(:teams => { :id => params[:team_id] })
    @hackers = User.joins(:teams).where(:affiliations => {:team_id => params[:team_id]})

    @affiliation = Affiliation.joins(:user).joins(:team).where(:teams => {:id => params[:team_id]}).where(:users => { :id => current_user.id }).first
    @is_member = false

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/new
  # GET /teams/new.json
  def new
    @team = Team.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @team }
    end
  end

  # GET /teams/1/edit
  def edit
    @team = Team.find(params[:id])
  end

  # POST /teams
  # POST /teams.json
  def create
    @team = Team.new(params[:team])
   
    respond_to do |format|
      if @team.save
        # save the affiliation of team creator to team
        @affiliation = Affiliation.new(:user_id => current_user.id, :team_id => @team.id, :approved => true)
        @affiliation.save

        format.html { redirect_to event_path + '/teams', notice: 'Your team was successfully created.' }
        format.json { render json: @team, status: :created, location: @team }
      else
        format.html { render action: "new", alert: 'Something went wrong creating your team.'  }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /teams/1
  # PUT /teams/1.json
  def update
    @team = Team.find(params[:id])

    respond_to do |format|
      if @team.update_attributes(params[:team])
        format.html { redirect_to @team, notice: 'Team was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @team.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /teams/1
  # DELETE /teams/1.json
  def destroy
    @team = Team.find(params[:id])
    @team.destroy

    respond_to do |format|
      format.html { redirect_to teams_url }
      format.json { head :no_content }
    end
  end
end
