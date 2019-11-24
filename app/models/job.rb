# frozen_string_literal: true

class Job < ApplicationRecord
  include FriendlyId
  friendly_id :title, use: [:slugged]
  validates :title, presence: true

  has_one :job_detail

  def self.create_scrap_job
    scrap = Scrap::Scrap.new
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
end
