require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module FriesApi
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    ActiveModelSerializers.config.adapter = :json # Default: `:attributes`

    config.adapter = :json
    config.api_only = true
    config.debug_exception_response_format = :api

    # CORS Middleware
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', :headers => :any, :methods => [:get, :post, :options]
      end
    end

    config.active_storage.replace_on_assign_to_many = false

    Rails.application.routes.default_url_options[:host] = 'http://localhost:3030'
  end
end
