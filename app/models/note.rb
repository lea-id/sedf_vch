class Note < ActiveRecord::Base
  attr_accessible :user_id, :date_incoming, :date_finishing

  belongs_to :user
  belongs_to :incoming

  validates :user_id, presence: true
  validates :date_incoming, presence: true
  validates :date_finishing, presence: true

  def self.next_serial_no
    next_serial_no = where(:year_at => Date.current.year).maximum(:serial_no)
    return next_serial_no.nil? ? 1 : next_serial_no + 1
  end
end
