require 'rulers'

$: << File.dirname(__FILE__)+'/../app/controllers'

module BestQuotes
  class Application < Rulers::Application
  end
end
