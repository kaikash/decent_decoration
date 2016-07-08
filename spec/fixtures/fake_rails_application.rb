require 'active_support/all'

require 'decent_exposure'
require 'decent_decoration'

require 'action_controller'
require 'action_dispatch'
require 'active_model'

module Rails
  class App
    def env_config; {} end

    def routes
      @routes ||= ActionDispatch::Routing::RouteSet.new.tap do |routes|
        routes.draw do
          resources :conferences, only: %i(show)
          resources :attendees, only: %i(show)
        end
      end
    end
  end

  def self.application
    @app ||= App.new
  end
end

require 'fixtures/models'
require 'fixtures/decorators'
require 'fixtures/controllers'
