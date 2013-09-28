class AffiliationsController < ApplicationController
  def index
    @affiliations = Affiliation.all
  end

  def show
    @affiliations = Affiliations.find(params[:id])
  end

  def new
    @affiliations = Affiliations.new
  end

  def create
    @affiliations = Affiliation.new(:user_id => params[:user_id], :team_id => params[:team_id])
    if @affiliations.save
      redirect_to :back, :notice => "You have been successfully REGISTERED for this team."
    else
      render :action => 'new'
    end
  end

  def edit
    @affiliations = Affiliations.find(params[:id])
  end

  def update
    @affiliations = Affiliations.find(params[:id])
    if @affiliations.update_attributes(params[:affiliations])
      redirect_to @affiliations, :notice  => "Successfully updated affiliations."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @affiliations = Affiliation.find(params[:id])
    @affiliations.destroy
    redirect_to :back, :notice => "You have been successfully unregistered from team."
    rescue ActionController::RedirectBackError
    redirect_to root_path, :notice => "You have been successfully UNREGISTERED from the team."
  end

end
