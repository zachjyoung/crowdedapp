class Event < ActiveRecord::Base

  validates_numericality_of :severity
  validates_presence_of :severity

  def self.severity
    (1..5).to_a
  end
end
