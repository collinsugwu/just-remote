# frozen_string_literal: true
class ScrapJobs
    include Sidekiq::Worker

    sidekiq_options retry: false

    def perform
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
end
