require 'rulers/version'
require 'rulers/routing'
require 'rulers/util'
require 'rulers/dependencies'
require 'rulers/controller'

module Rulers
  class Application
    def call env
      return [404, {'Content-type' => 'text/html'}, []] if
        '/favicon.ico' == env['PATH_INFO']

      klass, act = get_controller_and_action env
      raise "Oops: #{env}" unless klass
      controller = klass.new env
      [200, {'Content-Type' => 'text/html'}, [controller.send(act)]]
    end
  end
end
