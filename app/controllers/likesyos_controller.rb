class LikesyosController < ApplicationController
    def create
        @likesyo = current_user.likesyos.create(lessonsyo_id: params[:lessonsyo_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @likesyo = Likesyo.find_by(lessonsyo_id: params[:lessonsyo_id], user_id: current_user.id)
        @likesyo.destroy
        redirect_back(fallback_location: root_path)
    end
end
