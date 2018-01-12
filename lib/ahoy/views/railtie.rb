require 'rails/railtie'

module Ahoy
    module Views
        class Railtie < Rails::Railtie

            initializer 'ahoy-views.active_record' do
                ActiveSupport.on_load :active_record do
                    include Ahoy::Views::View
                end
            end

            initializer 'ahoy-views.action_controller' do
                ActiveSupport.on_load :action_controller do
                    include Ahoy::Views::Views
                    include Ahoy::Views::Viewer
                    include Ahoy::Views::Viewable
                end
            end

        end
    end
end
