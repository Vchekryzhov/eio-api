Rails.application.configure do
  config.cache_classes = false

  config.eager_load = false

  config.consider_all_requests_local = true

  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  config.active_storage.service = :local

  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  config.active_support.deprecation = :log

  config.active_record.migration_error = :page_load

  config.active_record.verbose_query_logs = true

  config.assets.debug = true

  config.assets.quiet = true

  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  ENV['ASSET_HOST'] = 'http://api.eio.test'
  ENV['IMG_PROXY_HOST'] = 'http://localhost:8080'
  config.asset_host = ENV['ASSET_HOST']
  ENV['IMGPROXY_KEY'] = '352e227e24a7544fd1707f68151d695e767f5c7a6e15194981f2158496e471103558b67b0d657b9df2e5b57821a0d1f3a0dd65bdc3cfc4dfc4746d69aa6fc2c4'
  ENV['IMGPROXY_SALT'] = '0dc02ce9c4095b4bd4d756c3f5554189c6a4c5e05e84338a5841703f7f5d946529157aba76504ea908dd5532bd4532138e57f063a7af124408f616e5c2a6268c'
end
