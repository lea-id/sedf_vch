class Internal < ActiveRecord::Base
  attr_accessible :title, :description, :attach, :remove_attach

  mount_uploader :attach, AttachUploader
  attr_accessor :skip_attach_extension_check

  validates :title, presence: true
  validates :description, presence: true
  validates :attach, presence: true

  belongs_to :user

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
