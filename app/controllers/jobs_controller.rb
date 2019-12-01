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

  def save_scraped_jobs
      scrap = Scraps::Scrap.new
      @data = scrap.job_links
      @data.each do |data|
        ActiveRecord::Base.transaction do
          job = Job.new
          job.title = data[:title]
          job.description = data[:description]
          job.location = data[:location]
          job.recruiter = data[:recruiter]
          job.stack = data[:stack]
          job.save
        end
      end
  end

  private

  def set_job
    @job = Job.friendly.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :user_id)
  end
end
