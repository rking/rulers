module Rulers
  class Controller
    def initialize env
      @env = env
    end

    attr_reader :env

    def render view_name, locals = {}
      filename = "app/views/#{view_name}.html.erb"
      template = File.read filename
      eruby = Erubis::Eruby.new template
      eruby.result locals.merge env: env
    end

  end
end
