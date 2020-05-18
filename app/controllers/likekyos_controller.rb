class LikekyosController < ApplicationController
    def create
        @likekyo = current_user.likekyos.create(lessonkyo_id: params[:lessonkyo_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @likekyo = Likekyo.find_by(lessonkyo_id: params[:lessonkyo_id], user_id: current_user.id)
        @likekyo.destroy
        redirect_back(fallback_location: root_path)
    end
end
