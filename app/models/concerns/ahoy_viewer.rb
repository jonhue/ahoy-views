module AhoyViewer

    extend ActiveSupport::Concern

    included do
        def ahoy_viewer
            has_many :ahoy_visits, as: :visitor, class_name: 'Ahoy::Event'
            has_many :ahoy_viewed, through: :ahoy_visits, source: :visited

            include AhoyViews::InstanceMethods
        end
    end

    module InstanceMethods

        # ...

    end

end
