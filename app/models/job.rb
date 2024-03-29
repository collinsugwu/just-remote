# frozen_string_literal: true

class Job < ApplicationRecord
  include FriendlyId
  friendly_id :title, use: [:slugged]
  validates :title, presence: true
  validates :description, presence: true

   self.per_page = 10
end
