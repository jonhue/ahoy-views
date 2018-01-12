module AhoyViewer

    extend ActiveSupport::Concern

    module ClassMethods

        def ahoy_viewer
            has_many :ahoy_visits, as: :visitor, class_name: 'Ahoy::Event'
            has_many :ahoy_viewed, through: :ahoy_visits, source: :visited

            include AhoyViewer::InstanceMethods
        end

    end

    module InstanceMethods

        # ...

    end

end
