class Execution < ActiveRecord::Base
  attr_accessible :user_id, :resolution, :execute_to, :data_control, :done

  belongs_to :user
  belongs_to :incoming

  has_many :outgoings, :dependent => :destroy

  validates :user_id, :presence => true
  validates :resolution, :presence => true
  validates :execute_to, :presence => true

  def self.next_serial_no
    next_serial_no = where(:year_at => Date.current.year).maximum(:serial_no)
    return next_serial_no.nil? ? 1 : next_serial_no + 1
  end

  def self.not_executed?
    return "(" + where("executions.data_control = ''").count.to_s + ")"
  end

  def self.not_executed(user_id)
    return "(" + where("user_id = ?", user_id).where("executions.data_control = ''").count.to_s + ")"
  end
end
