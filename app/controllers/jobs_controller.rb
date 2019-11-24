# frozen_string_literal: true

class JobsController < ApplicationController
  require_relative 'scrap'

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

  def create_scrap_job
    scrap = Scrap.new
    @data = scrap.job_links
    @data.each do |data|
      ActiveRecord::Base.transaction do
        job = Job.new
        job.title = data[:title]
        job.save

        job_detail = JobDetail.new
        job_detail.job_id = job.id
        job_detail.description = data[:description]
        job_detail.location = data[:location]
        job_detail.recruiter = data[:recruiter]
        job_detail.stack = data[:stack]
        job_detail.save
      end
    end
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
