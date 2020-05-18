class LikesosController < ApplicationController
    def create
        @likeso = current_user.likesos.create(lessonso_id: params[:lessonso_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @likeso = Likeso.find_by(lessonso_id: params[:lessonso_id], user_id: current_user.id)
        @likeso.destroy
        redirect_back(fallback_location: root_path)
    end
end
