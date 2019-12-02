class HomesController < ApplicationController
  def index
    @jobs = Job.paginate(page: params[:page])
  end
end
