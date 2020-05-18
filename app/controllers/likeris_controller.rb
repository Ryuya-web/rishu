class LikerisController < ApplicationController
    def create
        @likeri = current_user.likeris.create(lessonri_id: params[:lessonri_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @likeri = Likeri.find_by(lessonri_id: params[:lessonri_id], user_id: current_user.id)
        @likeri.destroy
        redirect_back(fallback_location: root_path)
    end
end
