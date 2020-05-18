class LikenosController < ApplicationController
    def create
        @likeno = current_user.likenos.create(lessonno_id: params[:lessonno_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @likeno = Likeno.find_by(lessonno_id: params[:lessonno_id], user_id: current_user.id)
        @likeno.destroy
        redirect_back(fallback_location: root_path)
    end
end
