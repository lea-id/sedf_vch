class Order < ActiveRecord::Base
  has_many :order_sents, :dependent => :destroy

  def self.next_serial_no
    next_serial_no = where(:year_at => Date.current.year).maximum(:serial_no)
    return next_serial_no.nil? ? 1 : next_serial_no + 1
  end
end
