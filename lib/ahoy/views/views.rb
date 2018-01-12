module Ahoy
    module Views
        module Views

            extend ActiveSupport::Concern

            module ClassMethods

                def ahoy_views
                    before_create :process_view

                    belongs_to :visitor, polymorphic: true, optional: true
                    belongs_to :visited, polymorphic: true, optional: true

                    scope :appearances, -> { where name: 'appearance' }
                    scope :views, -> { where name: 'view' }
                    scope :visitors, -> { where name: 'visitor' }
                    scope :returnees, -> { where name: 'returnee' }
                    scope :visited_in_session, -> (visit) { where visit_id: visit.id }
                    scope :visited, -> (visitor) { where visitor_id: visitor.id, visitor_type: visitor.class.name }

                    include AhoyView::InstanceMethods
                end

            end

            module InstanceMethods

                private

                def process_view
                    if self.visited && self.name
                        case self.name
                        when 'visitor'
                            return false if self.class.visitors.visited_in_session.where(visited_id: visited.id, visited_type: visited.class.name).any?
                        when 'returnee'
                            return false if self.class.returnees.visited_in_session.where(visited_id: visited.id, visited_type: visited.class.name).any? && !self.class.visited.where(visited_id: visited.id, visited_type: visited.class.name).any?
                        when 'unique_visitor'
                            return false if self.class.visitors.visited.where(visited_id: visited.id, visited_type: visited.class.name).any?
                        when 'unique_returnee'
                            return false if self.class.returnees.visited.where(visited_id: visited.id, visited_type: visited.class.name).any? && !self.class.visited.where(visited_id: visited.id, visited_type: visited.class.name).any?
                        end
                    end
                end

            end

        end
    end
end
