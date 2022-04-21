require_relative 'boot'

require 'rails'
# Pick the frameworks you want:
require 'active_model/railtie'
require 'active_job/railtie'
require 'active_record/railtie'
require 'active_storage/engine'
require 'action_controller/railtie'
require 'action_mailer/railtie'
require 'action_view/railtie'
require 'action_cable/engine'
require 'sprockets/railtie'
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module RunteqNormal
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
    config.generators do |g|
      g.assets false    # <= css,javascriptファイルを作成しない
      g.helper false    # <= helperファイルを作成しない
      g.test_framework false  # <= テストファイルを作成しない
      g.skip_routes true  # <= routes.rbを変更しない
    end

    # Don't generate system test files.
    config.generators.system_tests = nil
    # 翻訳設定
    config.i18n.default_locale = :ja # 日本語に設定
    config.i18n.load_path += Dir[Rails.root.join('config', 'locales', '**', '*.{rb,yml}').to_s] # ファイルの追加
    # タイムゾーンの設定
    config.time_zone = 'Asia/Tokyo'
  end
end
