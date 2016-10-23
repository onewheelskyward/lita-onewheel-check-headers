Lita.configure do |config|
  config.handlers.onewheel_check_headers.default = 'main'
  config.handlers.onewheel_check_headers.servers = {
      main: {
          urls: ['https://main.server'],
          headers: ['header1', 'header2']
      },
      secondary: {
          urls: ['http://secondary.url'],
          headers: ['header3', 'header4']
      }
  }
end
