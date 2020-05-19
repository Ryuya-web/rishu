class LessonkesController < ApplicationController
    before_action :authenticate_user!
    def index
        @lessonkes=Lessonke.page(params[:page]).per(8).order("created_at DESC") 
        @all_ranks = Lessonke.find(Likeke.group(:lessonke_id).order('count(lessonke_id) desc').limit(50).distinct.pluck(:lessonke_id))
    end
    def new
        @lessonke=Lessonke.new

    end
    def create
        @lessonke = Lessonke.new(lessonke_params)
        @lessonke.user_id = current_user.id
    if @lessonke.save
      flash[:update] = "lessonke was successfully created."
      redirect_to lessonkes_path
    else 
      @lessonkes = Lessonke.all
      render'new'
    end
    end
    def search
        @lessonkes = Lessonke.search(params[:search])
        @all_ranks = Lessonke.find(Likeke.group(:lessonke_id).order('count(lessonke_id) desc').limit(50).distinct.pluck(:lessonke_id))
    end
    def searches
        @lessonkes = Lessonke.searches(params[:search])
        @all_ranks = Lessonke.find(Likeke.group(:lessonke_id).order('count(lessonke_id) desc').limit(50).distinct.pluck(:lessonke_id))
    end
    def show
        @lessonke = Lessonke.find params[:id]
        @like = Likeke.new
        @lessonkes = Lessonke.where(title:@lessonke.title,teacher_name:@lessonke.teacher_name).order("created_at ASC") 
        @all_ranks = Lessonke.find(Likeke.group(:lessonke_id).order('count(lessonke_id) desc').limit(50).distinct.pluck(:lessonke_id))
    end
    def ranking
        
    end
    private
    def lessonke_params
        params.require(:lessonke).permit(:teacher_name, :title, :body)
    end
end
