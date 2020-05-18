class LikekesController < ApplicationController
    def create
        @likeke = current_user.likekes.create(lessonke_id: params[:lessonke_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @likeke = Likeke.find_by(lessonke_id: params[:lessonke_id], user_id: current_user.id)
        @likeke.destroy
        redirect_back(fallback_location: root_path)
    end
end
