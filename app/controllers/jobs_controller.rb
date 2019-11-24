# frozen_string_literal: true

class JobsController < ApplicationController

  before_action :set_job, only: %i[show update destroy]
  def index
    @jobs = Job.all
  end

  def show; end

  def new
    @job = Job.new
  end

  def edit; end

  def create
    @job = Job.new(job_param)
    @job.save
  end
  
  def update; end

  def destroy; end

  private

  def set_job
    @job = Job.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :user_id)
  end
end
