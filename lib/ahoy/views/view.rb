module Ahoy
    module Views
        module View

            extend ActiveSupport::Concern

            def ahoy_view objects, options = {}
                defaults = {
                    types: [:view],
                    viewer: nil
                }
                options = defaults.merge! options

                if current_visit
                    if objects.kind_of? Array
                        objects.each do |object|
                            track_ahoy_view object, options[:types], options[:viewer]
                        end
                    else
                        track_ahoy_view objects, options[:types], options[:viewer]
                    end
                end
            end

            private

            def track_ahoy_view object, types, viewer
                types.each do |name|
                    ahoy.track name, visited: object, visitor: viewer, visit: current_visit
                end
            end

        end
    end
end
