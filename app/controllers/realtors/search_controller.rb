class Realtors::SearchController < ApplicationController
  def index
    @realtors = Realtor.search_by_first_name(params[:first_name])
                       .order(:first_name)
                       .paginate(page: params[:page], per_page: 20)

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace("realtors_list", partial: "realtors/realtors_list", locals: { realtors: @realtors })
      end
      format.html { render "realtors/index" }
    end
  end
end
