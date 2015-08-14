class LeadsController < ApplicationController

before_action :require_user


  def index

    @leads = Lead.all
  end

  def new
    @lead = Lead.new
  end

  def edit

    @lead = Lead.find(params[:id])
  end

  def update

    @lead = Lead.find(params[:id])

    if @lead.update(lead_params)
      flash[:notice] = "The lead was updated"
      redirect_to leads_path
    else
      render :edit
    end
  end

  def create
binding.pry
    @lead = Lead.new(lead_params)
    @lead.creator = current_user  # TODO: change once we have authentication

    if @lead.save
      flash[:notice] = "Your lead was created"
      redirect_to leads_path
    else
      render :new
    end
  end


  private

  def lead_params
    params.require(:lead).permit(:name,:email, :phone_number, :website, :company, :company_type)
  end

 

end