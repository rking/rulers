require 'rulers/file_model'

module Rulers
  class Controller
    include ::Rulers::Model

    def initialize env
      @env = env
    end

    attr_reader :env

    def request; @request ||= Rack::Request.new env end
    def params; request.params end

    def response text, status = 200, headers = {}
      fail 'Already responded!' if @response
      @response = Rack::Response.new [text].flatten, status, headers
    end
    def render_response *args; response render *args end
    def get_response; @response end # "Only for Rulers"

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
