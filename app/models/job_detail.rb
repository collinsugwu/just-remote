class JobDetail < ApplicationRecord
  validates :description, presence: true

  belongs_to :job
end
