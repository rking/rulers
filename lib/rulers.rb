require 'rulers/version'
require 'rulers/routing'

module Rulers
  class Application
    def call env
      return [404, {'Content-type' => 'text/html'}, []] if
        '/favicon.ico' == env['PATH_INFO']

      klass, act = get_controller_and_action env
      controller = klass.new env
      [200, {'Content-Type' => 'text/html'}, [controller.send(act)]]
    end
  end

  class Controller
    def initialize env
      @env = env
    end
    attr_reader :env
  end
end
