require 'rest_client'

module Lita
  module Handlers
    class OnewheelCheckHeaders < Handler
      config :urls
      config :headers

      route(/^lllrev$/i, :handle_lll_rev, command: true,
            help: { '!lllrev' => 'Get the config-specified headers from the config-specified urls.'})

      def handle_lll_rev(response)
        reply = ''

        config.urls.each do |url|
          puts "Getting #{url}"
          puts "Headers to check #{config.headers.inspect}"
          rest_client_get = RestClient.get url
          rest_client_get.headers.each do |header, value|
            if config.headers.include? header.to_s
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
