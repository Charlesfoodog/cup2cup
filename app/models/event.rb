class Event < ActiveRecord::Base
  extend TimeSplitter::Accessors
  split_accessor :start_time

  belongs_to :user
  

  geocoded_by :full_street_address



  def has_address?
    longitude.present? && latitude.present?
  end

  def full_street_address
    address
  end

  after_validation :geocode
end
