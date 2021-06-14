class HomesController < ApplicationController
  def index
    @jobs = Job.paginate(page: params[:page]).order("id DESC")
  end

  def about; end
end
