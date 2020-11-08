Rails.application.configure do
  config.cache_classes = true

  config.eager_load = true

  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  config.public_file_server.enabled = ENV['RAILS_SERVE_STATIC_FILES'].present?

  config.assets.compile = false

  config.active_storage.service = :local

  config.log_level = :debug

  config.log_tags = [ :request_id ]

  config.action_mailer.perform_caching = false

  config.i18n.fallbacks = true

  config.active_support.deprecation = :notify

  config.log_formatter = ::Logger::Formatter.new


  if ENV["RAILS_LOG_TO_STDOUT"].present?
    logger           = ActiveSupport::Logger.new(STDOUT)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  end

  config.active_record.dump_schema_after_migration = false
  config.action_controller.default_url_options = { host: 'cnc-api.kovalev.team', port: 80 }

  ENV['ASSET_HOST'] = 'https://cnc-api.kovalev.team'
  ENV['IMG_PROXY_HOST'] = 'https://imgproxy.kovalev.team'
  config.asset_host = ENV['ASSET_HOST']
  ENV['IMGPROXY_KEY'] = '352e227e24a7544fd1707f68151d695e767f5c7a6e15194981f2158496e471103558b67b0d657b9df2e5b57821a0d1f3a0dd65bdc3cfc4dfc4746d69aa6fc2c4'
  ENV['IMGPROXY_SALT'] = '0dc02ce9c4095b4bd4d756c3f5554189c6a4c5e05e84338a5841703f7f5d946529157aba76504ea908dd5532bd4532138e57f063a7af124408f616e5c2a6268c'

end
