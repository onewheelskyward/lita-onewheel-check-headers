require 'rest_client'

module Lita
  module Handlers
    class OnewheelCheckHeaders < Handler
      config :default
      config :servers

      route(/^lllrev\s*(.*)$/i, :handle_lll_rev, command: true,
            help: { '!lllrev' => 'Get the config-specified headers from the config-specified urls.'})

      def handle_lll_rev(response)
        reply = ''

        server = response.matches[0][0]
        if server.empty?
          server = config.default
        end

        puts "#{server}"
        puts config.servers
        check_this = config.servers[server.to_sym]

        check_this[:urls].each do |url|
          puts "Getting #{url}"
          puts "Headers to check #{check_this[:headers].inspect}"
          rest_client_get = RestClient.get url
          rest_client_get.headers.each do |header, value|
            if check_this[:headers].include? header.to_s
              puts "Adding to reply: #{url} #{header}: #{value}"
              reply += "#{url} #{header}: #{value}\n"
            end
          end
        end

        response.reply reply
      end
    end

    Lita.register_handler(OnewheelCheckHeaders)
  end
end
