class HackersController < ApplicationController
 before_filter :authenticate_user!, :except => [:show,:index]

  # Using Hackers instead of Users, which maycause confusion

  # GET /hackers
  # GET /hackers.json
  def index
  @event = Event.find(params[:id])

    if params[:tag] && params[:id]

      @hackers = User.tagged_with(params[:tag]).joins(:events).where(:attendances => {:event_id => params[:id]})

    elsif params[:id]

      # join hackers and users and get hackers from the specified event
      @hackers = User.joins(:events).where(:attendances => {:event_id => params[:id]})
      @attendances = Attendance.where("user_id = ?", current_user.id)
    
    elsif params[:tag] and not params[:id]

      @hackers = User.tagged_with(params[:tag])

    else

      @hackers = Hacker.all

    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hackers }
    end
  end

  # GET /hackers/1
  # GET /hackers/1.json
  def show

    @hacker = User.find(params[:hacker_id]) if params[:hacker_id]

    if params['id']
      # show in context of specific event
      @event = Event.find(params[:id]) if params[:id]
      @team = Team.joins(:users).where(:users => {:id => params['id']}).first
      @hacks = Hack.where("team_id = ?", @team.id)
    else
      # show all events if no event specified
      @attendances = Attendance.where("user_id = ?", params[:hacker_id])
      # select * from hacks inner join teams on hacks.team_id = teams.id 
      # inner join affiliations on teams.id = affiliations.team_id 
      # inner join users on users.id = affiliations.user_id 
      # where users.id = 3;
      @hacks = Hack.joins(:team => :users).where('users.id = ?', params[:hacker_id])   
    end

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hacker }
    end
  end

  # GET
  def new
    #before_filter :authenticate_user!

    @event = Event.find(params[:id])
    @hacker = Hacker.where(user_id: current_user.id)

      respond_to do |format|
          format.html # new.html.erb
          #format.json { render json: @hacker, status: :created, location: @hacker }
      end
    #@hacker = Hacker.new

    #respond_to do |format|
    #  format.html # new.html.erb
    #  format.json { render json: @hacker }
    #end
  end

  # GET
  def edit
    # trying to make hackers independent of events
    if params[:hacker_id]
      @hacker = User.find(params[:hacker_id])
    elsif User.exists?(:user_id => current_user.id)
      @hacker = User.where(:user_id => current_user.id).first
    else
      @hacker = User.new(:user_id => params['user_id'])  
        if @User.save
          redirect_to @User
        else
          # This line overrides the default rendering behavior, which
          # would have been to render the "create" view.
          render "new"
        end
    end
  end

  # POST
  def create
    @hacker = User.new(params[:hacker])

    respond_to do |format|
      if @hacker.save
        format.html { redirect_to @hacker, notice: 'Hacker was successfully created.' }
        format.json { render json: @hacker, status: :created, location: @hacker }
      else
        format.html { render action: "new" }
        format.json { render json: @hacker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT 
  def update

    #hacker_id = params[:hacker_id] ? params[:hacker_id] : params[:hacker][:id]
    #@hacker = Hacker.find(hacker_id) 
    @hacker = Hacker.find(params[:hacker_id]) 

    respond_to do |format|
      if @hacker.update_attributes(params[:hacker])
        format.html { redirect_to @hacker, notice: 'Hacker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hacker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hackers/1
  # DELETE /hackers/1.json
  def destroy
    @hacker = Hacker.find(params[:id])
    @hacker.destroy

    respond_to do |format|
      format.html { redirect_to hackers_url }
      format.json { head :no_content }
    end
  end
end
