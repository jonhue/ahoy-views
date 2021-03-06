module Ahoy
    module Views
        module Viewable

            extend ActiveSupport::Concern

            module ClassMethods

                def ahoy_viewable
                    has_many :ahoy_views, as: :visited, class_name: 'Ahoy::Event'
                    has_many :ahoy_viewers, through: :ahoy_views, source: :visitor

                    scope :trending, -> { left_joins(:views).group(:id).order('count(views.id) desc') }

                    include Ahoy::Views::Viewable::InstanceMethods
                end

            end

            module InstanceMethods

                def trending? limit
                    self.class.trending.limit(limit).include? self
                end

            end

        end
    end
end
