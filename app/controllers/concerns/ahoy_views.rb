module AhoyViews

    extend ActiveSupport::Concern

    def ahoy_views objects, types = [:view]
        if objects.kind_of? Array
            objects.each do |object|
                track_ahoy_views object, types
            end
        else
            track_ahoy_views objects, types
        end
    end

    private

    def track_ahoy_views objects, types
        types.each do |name|
            ahoy.track name, model: objects
        end
    end

end
