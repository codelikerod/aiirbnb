module ApplicationHelper
    
    def avatar_url(user)
           if user.avatar.present?
               user.avatar.url
           else
               'default_image.png'
           end
    end
    
end
