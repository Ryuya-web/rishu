class LessonsesController < ApplicationController
    before_action :authenticate_user!
    def index
        @lessonses=Lessonse.page(params[:page]).per(8).order("created_at DESC") 
        @all_ranks = Lessonse.find(Like.group(:lessonse_id).order('count(lessonse_id) desc').limit(50).distinct.pluck(:lessonse_id))
    end
    def new
        @lessonse=Lessonse.new

    end
    def create
        @lessonse = Lessonse.new(lessonse_params)
        @lessonse.user_id = current_user.id
    if @lessonse.save
      flash[:update] = "lessonse was successfully created."
      redirect_to lessonses_path
    else 
      @lessonses = Lessonse.all
      render'new'
    end
    end
    def search
        @lessonses = Lessonse.search(params[:search])
        @all_ranks = Lessonse.find(Like.group(:lessonse_id).order('count(lessonse_id) desc').limit(50).distinct.pluck(:lessonse_id))
    end
    def searches
        @lessonses = Lessonse.searches(params[:search])
        @all_ranks = Lessonse.find(Like.group(:lessonse_id).order('count(lessonse_id) desc').limit(50).distinct.pluck(:lessonse_id))
    end
    def show
        @lessonse = Lessonse.find params[:id]
        @like = Like.new
        @lessonses = Lessonse.where(title:@lessonse.title).order("created_at ASC") 
        @all_ranks = Lessonse.find(Like.group(:lessonse_id).order('count(lessonse_id) desc').limit(50).distinct.pluck(:lessonse_id))
    end
    def ranking
        
    end
    private
    def lessonse_params
        params.require(:lessonse).permit(:teacher_name, :title, :body)
    end
end
