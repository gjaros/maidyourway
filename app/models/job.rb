class Job < ApplicationRecord
  has_and_belongs_to_many :users, dependent: :destroy
  serialize :workers, Array

end
