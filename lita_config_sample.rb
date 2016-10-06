Lita.configure do |config|
  config.handlers.onewheel_check_headers.urls = %w(uri1 uri2)
  config.handlers.onewheel_check_headers.headers = %w(headers to look for)
end
