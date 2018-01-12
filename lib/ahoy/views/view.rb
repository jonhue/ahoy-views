module Ahoy
    module Views
        module View

            extend ActiveSupport::Concern

            def ahoy_view objects, types = [:view]
                if objects.kind_of? Array
                    objects.each do |object|
                        track_ahoy_view object, types
                    end
                else
                    track_ahoy_view objects, types
                end
            end

            private

            def track_ahoy_view objects, types
                types.each do |name|
                    ahoy.track name, model: objects
                end
            end

        end
    end
end
