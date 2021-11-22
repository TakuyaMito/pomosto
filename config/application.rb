require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Pomosto
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.generators do |g|
      g.skip_routes true
      g.helper false
      g.test_framework
    end

    # デフォルトの言語
    config.i18n.default_locale = :ja
    # 言語ファイルのパス
    config.i18n.load_path += Dir[Rails.root.join('config/locales/**/*.{rb,yml}').to_s]
    config.time_zone = 'Tokyo'
    config.active_record.default_timezone = :local
  end
end
