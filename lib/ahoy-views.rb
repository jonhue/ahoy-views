require 'ahoy/views/version'

module Ahoy
    module Views

        autoload :View, 'ahoy/views/view'
        autoload :Viewable, 'ahoy/views/viewable'
        autoload :Viewer, 'ahoy/views/viewer'
        autoload :Views, 'ahoy/views/views'

        require 'ahoy/views/railtie'

    end
end
