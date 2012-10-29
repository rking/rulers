require 'rulers'

$: << File.dirname(__FILE__)+'/../app/controllers'
require 'quotes_controller'

module BestQuotes
  class Application < Rulers::Application
  end
end
