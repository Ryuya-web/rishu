class LikekosController < ApplicationController
    def create
        @likeko = current_user.likekos.create(lessonko_id: params[:lessonko_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @likeko = Likeko.find_by(lessonko_id: params[:lessonko_id], user_id: current_user.id)
        @likeko.destroy
        redirect_back(fallback_location: root_path)
    end
end
