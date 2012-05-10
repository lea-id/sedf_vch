class Outgoing < ActiveRecord::Base
  attr_accessible :serial_no, :doc_no, :doc_date, :address, :description, :copy_count, :copy_no, :pages,
                  :in_out_no, :delo_no, :delo_pages, :attach, :remove_attach, :user_id, :data_control, :done

  mount_uploader :attach, AttachUploader
  attr_accessor :skip_attach_extension_check, :data_control, :done

  belongs_to :user
  belongs_to :execution

  #validates :doc_no, presence: true
  #validates :doc_date, presence: true
  validates :address, presence: true
  validates :description, presence: true
  validates :copy_count, presence: true
  validates :copy_no, presence: true
  validates :pages, presence: true
  #validates :in_out_no, presence: true
  validates :user_id, presence: true
  validates :data_control, presence: true #фиктивное поле для автомата заполнения журнала контроля
  validates :done, presence: true #фиктивное поле для автомата заполнения журнала контроля

  def file_attach_url=(url)
    begin
      self.skip_attach_extension_check = true
      attach.download!(url)
    ensure
      self.skip_attach_extension_check = false
    end

    path = attach.path
    ext = File.extname(path)

    logger.debug "Downloaded file extension - #{ext}"

    if ext.blank? && ext = detect_extension(path)
      logger.debug "Detected extension for attach - #{ext}"
      path = path + ".#{ext}"
      FileUtils.mv(attach.path, path)
      attach.remove!
      self.attach = File.open(path)
    end

    attach.send(:check_whitelist!, CarrierWave::SanitizedFile.new(File.open(path)))

    attach.store!
    save!
  end
  
  def is_pdf(url)
    '.pdf' == File.extname(url)
  end

  def self.next_serial_no
    next_serial_no = where(:year_at => Date.current.year).maximum(:serial_no)
    return next_serial_no.nil? ? 1 : next_serial_no + 1
  end

  protected

  def detect_extension(file_name)
    mime_type = %x(file --mime #{file_name}|cut -f2 -d' ').gsub("\n", "")
    #mime_type = MimeMagic.by_path('filename.txt')
    case mime_type
    when 'image/jpeg'
      'jpg'
    when 'image/jpg'
      'jpg'
    when 'image/png'
      'png'
    when 'image/gif'
      'gif'
    when 'application/pdf'
      'pdf'
    else
      mime_type
    end
  end
end
