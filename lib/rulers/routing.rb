# encoding: utf-8
module Rulers
  class Application
    def get_controller_and_action env
      path = env['PATH_INFO']
      _, cont, action, after = path.split '/', 4
      cont = cont.capitalize + 'Controller'
      klass = Object.const_get(cont)
      fail <<-EOT unless klass
Could not find #{cont} -
path: #{path} ⇒
  action: #{action}
  after: #{after}
      EOT
      [klass, action]
    end
  end
end
