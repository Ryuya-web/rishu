class LessonrisController < ApplicationController
    before_action :authenticate_user!
    def index
        @lessonris=Lessonri.page(params[:page]).per(8).order("created_at DESC") 
        @all_ranks = Lessonri.find(Likeri.group(:lessonri_id).order('count(lessonri_id) desc').limit(50).distinct.pluck(:lessonri_id))
    end
    def new
        @lessonri=Lessonri.new

    end
    def create
        @lessonri = Lessonri.new(lessonri_params)
        @lessonri.user_id = current_user.id
    if @lessonri.save
      flash[:update] = "lessonri was successfully created."
      redirect_to lessonris_path
    else 
      @lessonris = Lessonri.all
      render'new'
    end
    end
    def search
        @lessonris = Lessonri.search(params[:search])
        @all_ranks = Lessonri.find(Likeri.group(:lessonri_id).order('count(lessonri_id) desc').limit(50).distinct.pluck(:lessonri_id))
    end
    def searches
        @lessonris = Lessonri.searches(params[:search])
        @all_ranks = Lessonri.find(Likeri.group(:lessonri_id).order('count(lessonri_id) desc').limit(50).distinct.pluck(:lessonri_id))
    end
    def show
        @lessonri = Lessonri.find params[:id]
        @like = Likeri.new
        @lessonris = Lessonri.where(title:@lessonri.title,teacher_name:@lessonri.teacher_name).order("created_at ASC") 
        @all_ranks = Lessonri.find(Likeri.group(:lessonri_id).order('count(lessonri_id) desc').limit(50).distinct.pluck(:lessonri_id))
    end
    def ranking
        
    end
    private
    def lessonri_params
        params.require(:lessonri).permit(:teacher_name, :title, :body)
    end
end
