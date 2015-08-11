class LeadsController < ApplicationController

  def index
    @leads = Lead.all
  end

  def new
    @lead = Lead.new
  end

  def create

    @lead = Lead.new(lead_params)
    @lead.creator = User.first  # TODO: change once we have authentication

    if @lead.save
      flash[:notice] = "Your lead was created"
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def lead_params
    params.require(:lead).permit(:name,:email, :phone_number, :website, :company, :company_type)
  end

end