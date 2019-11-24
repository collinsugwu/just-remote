# frozen_string_literal: true

class Job < ApplicationRecord
  include FriendlyId
  friendly_id :title, use: [:slugged]
  validates :title, presence: true

  has_one :job_detail
end
