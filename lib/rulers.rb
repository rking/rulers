%w(
  version
  routing
  util
  dependencies
  controller
  file_model
).each do |part| require 'rulers/'+part end

module Rulers
  class Application
    def call env
      return [404, utf8ify({}), []] if
        '/favicon.ico' == env['PATH_INFO']

      klass, act = get_controller_and_action env
      raise "Oops: #{env}" unless klass
      controller = klass.new env
      text = controller.send act
      if controller.get_response
        status, headers, resp = controller.get_response.to_a
        [status, utf8ify(headers), [resp.body].flatten]
      else
        [200, utf8ify({}), [text]]
      end
    end

    def utf8ify headers
      key = 'Content-Type'
      headers.merge key => 'text/html; charset=UTF-8' \
        if headers[key].nil? or 'text/html' == headers[key]
    end
  end
end
