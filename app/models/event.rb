class Event < ActiveRecord::Base
  has_many :users, through: :meetings
  has_many :meetings
end
