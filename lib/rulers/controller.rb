require 'rulers/file_model'

module Rulers
  class Controller
    include ::Rulers::Model

    def initialize env
      @env = env
    end

    attr_reader :env

    def render view_name, locals = {}
      filename = "app/views/#{controller_name}/#{view_name}.html.erb"
      template = File.read filename
      eruby = Erubis::Eruby.new template
      eruby.result locals.merge env: env
    end

    def controller_name
      klass = self.class.to_s.sub /Controller$/, ''
      Rulers.to_underscore klass
    end
  end
end
