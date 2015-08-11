class LeadsController < ApplicationController

  def index
    @leads = Lead.all
  end

  def new
    @lead = Lead.new
  end

  def create
    @lead = Lead.new(lead_params)
binding.pry

  end


  private

  def lead_params
    params.require(:name).permit(:name,:email, :phone_number, :website, :company, :company_type)
  end

end