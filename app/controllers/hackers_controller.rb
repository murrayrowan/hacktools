class HackersController < ApplicationController
 before_filter :authenticate_user!, :except => [:show,:index]

  # GET /hackers
  # GET /hackers.json
  def index
  @event = Event.find(params[:id])

    if params[:tag]

      @hackers = Hacker.tagged_with(params[:tag])

    elsif params[:id]

    # select * from hackers where id in (select hacker_id from events_hackers_teams where event_id = params[:id]);
      @hackers = Hacker.where(id: EventsHackersHacksTeams.select("hacker_id").where(event_id: params[:id]))
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

    @hacker = Hacker.find(params[:hacker_id]) if params[:hacker_id]
    @event = Event.find(params[:id]) if params[:id]
  
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
    # tryint to make hackers independent of events
    if params[:hacker_id]
      @hacker = Hacker.find(params[:hacker_id])
    elsif Hacker.exists?(:user_id => current_user.id)
      @hacker = Hacker.where(:user_id => current_user.id).first
    else
      @hacker = Hacker.new(:user_id => params['user_id'])  
        if @Hacker.save
          redirect_to @Hacker
        else
          # This line overrides the default rendering behavior, which
          # would have been to render the "create" view.
          render "new"
        end
    end
  end

  # POST
  def create
    @hacker = Hacker.new(params[:hacker])

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
