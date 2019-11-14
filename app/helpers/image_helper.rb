module ImageHelper
    def custom_image_for(resource)
        puts resource.photo
        if resource.photo.present?
            cl_image_path resource.photo, height: 300, width: 400, crop: :fill 
        else
            # image_url "cocktail.jpg"
            image_path resource.photo
        end
    end 
end