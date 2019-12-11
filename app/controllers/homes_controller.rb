class HomesController < ApplicationController
  def index
    @jobs = Job.paginate(page: params[:page]).order("id DESC")
  end
end
