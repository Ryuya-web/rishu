class LessonnosController < ApplicationController
    before_action :authenticate_user!
    def index
        @lessonnos=Lessonno.page(params[:page]).per(8).order("created_at DESC") 
        @all_ranks = Lessonno.find(Like.group(:lessonno_id).order('count(lessonno_id) desc').limit(50).distinct.pluck(:lessonno_id))
    end
    def new
        @lessonno=Lessonno.new

    end
    def create
        @lessonno = Lessonno.new(lessonno_params)
        @lessonno.user_id = current_user.id
    if @lessonno.save
      flash[:update] = "lessonno was successfully created."
      redirect_to lessonnos_path
    else 
      @lessonnos = Lessonno.all
      render'new'
    end
    end
    def search
        @lessonnos = Lessonno.search(params[:search])
        @all_ranks = Lessonno.find(Like.group(:lessonno_id).order('count(lessonno_id) desc').limit(50).distinct.pluck(:lessonno_id))
    end
    def searches
        @lessonnos = Lessonno.searches(params[:search])
        @all_ranks = Lessonno.find(Like.group(:lessonno_id).order('count(lessonno_id) desc').limit(50).distinct.pluck(:lessonno_id))
    end
    def show
        @lessonno = Lessonno.find params[:id]
        @like = Like.new
        @lessonnos = Lessonno.where(title:@lessonno.title,teacher_name:@lessonno.teacher_name).order("created_at ASC") 
        @all_ranks = Lessonno.find(Like.group(:lessonno_id).order('count(lessonno_id) desc').limit(50).distinct.pluck(:lessonno_id))
    end
    def ranking
        
    end
    private
    def lessonno_params
        params.require(:lessonno).permit(:teacher_name, :title, :body)
    end
end
