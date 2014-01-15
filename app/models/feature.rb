class Feature < ActiveRecord::Base
  belongs_to :project
  has_many :scenarios
end
