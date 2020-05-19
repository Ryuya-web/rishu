class LessonkosController < ApplicationController
    before_action :authenticate_user!
    def index
        @lessonkos=Lessonko.page(params[:page]).per(8).order("created_at DESC") 
        @all_ranks = Lessonko.find(Likeko.group(:lessonko_id).order('count(lessonko_id) desc').limit(50).distinct.pluck(:lessonko_id))
    end
    def new
        @lessonko=Lessonko.new

    end
    def create
        @lessonko = Lessonko.new(lessonko_params)
        @lessonko.user_id = current_user.id
    if @lessonko.save
      flash[:update] = "lessonko was successfully created."
      redirect_to lessonkos_path
    else 
      @lessonkos = Lessonko.all
      render'new'
    end
    end
    def search
        @lessonkos = Lessonko.search(params[:search])
        @all_ranks = Lessonko.find(Likeko.group(:lessonko_id).order('count(lessonko_id) desc').limit(50).distinct.pluck(:lessonko_id))
    end
    def searches
        @lessonkos = Lessonko.searches(params[:search])
        @all_ranks = Lessonko.find(Likeko.group(:lessonko_id).order('count(lessonko_id) desc').limit(50).distinct.pluck(:lessonko_id))
    end
    def show
        @lessonko = Lessonko.find params[:id]
        @like = Likeko.new
        @lessonkos = Lessonko.where(title:@lessonko.title,teacher_name:@lessonko.teacher_name).order("created_at ASC") 
        @all_ranks = Lessonko.find(Likeko.group(:lessonko_id).order('count(lessonko_id) desc').limit(50).distinct.pluck(:lessonko_id))
    end
    def ranking
        
    end
    private
    def lessonko_params
        params.require(:lessonko).permit(:teacher_name, :title, :body)
    end
end
