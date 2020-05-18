class LikehsController < ApplicationController
    def create
        @likeh = current_user.likehs.create(lessonh_id: params[:lessonh_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @likeh = Likeh.find_by(lessonh_id: params[:lessonh_id], user_id: current_user.id)
        @likeh.destroy
        redirect_back(fallback_location: root_path)
    end
end
