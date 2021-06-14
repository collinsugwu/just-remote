# frozen_string_literal: true

class JobsController < ApplicationController

  before_action :set_job, only: %i[show update destroy]
  def index
    @jobs = Job.paginate(page: params[:page], per_page: 15).order(created_at: :desc)
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
      data = scrap.job_links
      data.in_groups_of(50) do |datum|
        ActiveRecord::Base.transaction do
          Job.insert_all([
            data,
            returning: %w[ id title description location recruiter stack ]
          ])
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
