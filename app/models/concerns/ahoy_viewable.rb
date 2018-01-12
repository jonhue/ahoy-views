module AhoyViewable

    extend ActiveSupport::Concern

    included do
        def ahoy_viewable
            has_many :ahoy_views, as: :visited, class_name: 'Ahoy::Event'
            has_many :ahoy_viewers, through: :ahoy_views, source: :visitor

            scope :trending, -> { left_joins(:views).group(:id).order('count(views.id) desc') }

            include AhoyViews::InstanceMethods
        end
    end

    module InstanceMethods

        def trending? limit
            self.class.trending.limit(limit).include? self
        end

    end

end
