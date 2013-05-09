class AffiliationsController < ApplicationController
  def index
    @affiliations = Affiliations.all
  end

  def show
    @affiliations = Affiliations.find(params[:id])
  end

  def new
    @affiliations = Affiliations.new
  end

  def create
    @affiliations = Affiliations.new(params[:affiliations])
    if @affiliations.save
      redirect_to @affiliations, :notice => "Successfully created affiliations."
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
    redirect_to '/', :notice => "You have been successfully unregistered from team."
  end
end
