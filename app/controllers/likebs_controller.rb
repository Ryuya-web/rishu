class LikebsController < ApplicationController
    def create
        @likeb = current_user.likebs.create(lessonb_id: params[:lessonb_id])
        redirect_back(fallback_location: root_path)
    end
    
    def destroy
        @likeb = Likeb.find_by(lessonb_id: params[:lessonb_id], user_id: current_user.id)
        @likeb.destroy
        redirect_back(fallback_location: root_path)
    end
end
