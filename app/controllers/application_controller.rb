class ApplicationController < ActionController::API
  respond_to :json

  before_action :set_active_storage_host

  def set_active_storage_host
    ActiveStorage::Current.host = ENV.fetch('HOST_URL', 'http://localhost:3030/api')
  end
end
