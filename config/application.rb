require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Easymap
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.1
    config.i18n.available_locales = [:en, :ja]
    config.i18n.default_locale = :ja
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
    config.autoload_paths += %W(#{config.root}/lib) # 20180228追記
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
  end
end
