class JobDetail < ApplicationRecord
  validates :detail, presence: true

  belongs_to :job
end
