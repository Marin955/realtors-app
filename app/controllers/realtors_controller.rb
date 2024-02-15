class RealtorsController < ApplicationController
  def index
    @realtors = Realtor.oder(:first_name).paginate(page: params[:page], per_page: 20)
  end

  def search
    @realtors = Realtor.search_by_first_name(params[:first_name])
                       .order(:first_name)
                       .paginate(page: params[:page], per_page: 20)
    render :index
  end
end
