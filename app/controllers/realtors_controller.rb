class RealtorsController < ApplicationController
  def index
    @realtors = Realtor.order(:first_name).paginate(page: params[:page], per_page: 20)
  end
end
