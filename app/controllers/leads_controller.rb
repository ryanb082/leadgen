class LeadsController < ApplicationController

  def index
    @leads = Lead.all
  end


  def lead_params
    params.require(:lead).permit(:name, :email, :phone_number, :website, :company, :company_type)
  end

end