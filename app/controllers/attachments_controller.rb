class AttachmentsController < ApplicationController
  def show
    filename = CGI.unescape("#{params[:filename]}.#{params[:extension]}")
    id = CGI.unescape(params[:id])

    @attachment = ActiveStorage::Blob.find_by(id: id, filename: filename)

    if @attachment.nil?
      return render status: :not_found, json: { message: I18n.t(:attachment_not_found) }
    end

    unless options_params.empty?
      @attachment = @attachment.variant(options_params.as_json).processed
    end

    @file = @attachment.service_url

    redirect_to @file, status: 302
  rescue StandardError => e
    render status: :not_found, json: { message: I18n.t(:attachment_not_found) }
  end

  private

  def options_params
    params.permit(:resize)
  end
end
