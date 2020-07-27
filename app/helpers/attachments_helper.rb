module AttachmentsHelper
  @placeholder_url = 'https://s3-us-west-2.amazonaws.com/golden-leaf/pictures/images/NoImage.jpg'

  def attachment_placeholder(array = false)
    if array
      [@placeholder_url]
    else
      @placeholder_url
    end
  end

  def get_url(attachment, options = {})
    if attachment&.blob&.present?
      URI("#{ENV.fetch('ACTIVE_STORAGE_HOST')}/attachments/#{CGI.escape(attachment.blob.id.to_s)}.#{CGI.escape(attachment.blob.filename.to_s)}#{options.present? ? "?#{options.to_query}" : ''}")
    else
      attachment_placeholder
    end
  end

  def get_attachment_url(attachment, options = {})
    is_one_attachment = attachment.respond_to?(:attachment)
    is_many_attachment = attachment.respond_to?(:attachments)

    raise StandardError unless attachment.attached?

    if is_one_attachment
      get_url(attachment, options)

    elsif is_many_attachment
      attachment.map do |single_attachment|
        get_url(single_attachment, options)
      end.compact

    else
      attachment_placeholder
    end
  rescue StandardError
    attachment_placeholder(is_many_attachment)
  end

  def attachments_hash(attachments, options = {})
    attachments.map do |attachment|
      {
        id: attachment.id,
        name: attachment.blob.filename,
        size: attachment.blob.byte_size,
        src: get_url(attachment, options)
      }
    end
  end

end
