class LikesesController < ApplicationController
    def create
        @likese = current_user.likeses.create(lessonse_id: params[:lessonse_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @likese = Likese.find_by(lessonse_id: params[:lessonse_id], user_id: current_user.id)
        @likese.destroy
        redirect_back(fallback_location: root_path)
    end
end
