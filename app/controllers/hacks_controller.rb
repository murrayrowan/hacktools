class HacksController < ApplicationController
  # GET /hacks
  # GET /hacks.json
  def index
    @event = Event.find(params[:id])
    
    # if tag and event id passed in
    if params[:tag] && params[:id]

      #get hacks from teams at the specified event which are tagged with tag  
      @hacks = Hack.tagged_with(params[:tag]).where(team_id: Team.select("id").where(event_id: params[:id]))
     
    # if an event id, but no tag filter
    elsif params[:id]
      # get the hacks from the teams at the event
      # join == 0.1ms
      @hacks = Hack.joins(:team).where(:teams => { :event_id => params[:id] })

    # else if there's a tag, but no event id
    elsif params[:tag] and not params[:id]

      #get all hacks tagged with tag across all event
      @hacks = Hack.tagged_with(params[:tag])

    else

      #get all hacks if no params for event or tag are passed through
      @hacks = Hack.all

    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @hacks }
    end
  end

  # GET /hacks/1
  # GET /hacks/1.json
  def show
    @hack = Hack.find(params[:hack_id])
    @event = Event.find(params[:id])

    @team = Team.joins(:hacks).where(:hacks => {:id => params[:hack_id] }).first

    @hackers = User.joins(:teams).where(:affiliations => {:team_id => @team.id})

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @hack }
    end
  end

  # GET /hacks/new
  # GET /hacks/new.json
  def new
    @hack = Hack.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @hack }
    end
  end

  # GET /hacks/1/edit
  def edit
    @hack = Hack.find(params[:id])
  end

  # POST /hacks
  # POST /hacks.json
  def create
    @hack = Hack.new(params[:hack])

    respond_to do |format|
      if @hack.save
        format.html { redirect_to @hack, notice: 'Hack was successfully created.' }
        format.json { render json: @hack, status: :created, location: @hack }
      else
        format.html { render action: "new" }
        format.json { render json: @hack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /hacks/1
  # PUT /hacks/1.json
  def update
    @hack = Hack.find(params[:id])

    respond_to do |format|
      if @hack.update_attributes(params[:hack])
        format.html { redirect_to @hack, notice: 'Hack was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @hack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /hacks/1
  # DELETE /hacks/1.json
  def destroy
    @hack = Hack.find(params[:id])
    @hack.destroy

    respond_to do |format|
      format.html { redirect_to hacks_url }
      format.json { head :no_content }
    end
  end
end
