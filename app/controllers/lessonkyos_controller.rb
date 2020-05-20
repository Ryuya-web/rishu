class LessonkyosController < ApplicationController
    before_action :authenticate_user!
    def index
        @lessonkyos=Lessonkyo.page(params[:page]).per(8).order("created_at DESC") 
        @all_ranks = Lessonkyo.find(Likekyo.group(:lessonkyo_id).order('count(lessonkyo_id) desc').limit(50).pluck(:lessonkyo_id))
    end
    def new
        @lessonkyo=Lessonkyo.new

    end
    def create
        @lessonkyo = Lessonkyo.new(lessonkyo_params)
        @lessonkyo.user_id = current_user.id
    if @lessonkyo.save
      flash[:update] = "lessonkyo was successfully created."
      redirect_to lessonkyos_path
    else 
      @lessonkyos = Lessonkyo.all
      render'new'
    end
    end
    def search
        @lessonkyos = Lessonkyo.search(params[:search])
        @all_ranks = Lessonkyo.find(Likekyo.group(:lessonkyo_id).order('count(lessonkyo_id) desc').limit(50).pluck(:lessonkyo_id))
    end
    def searches
        @lessonkyos = Lessonkyo.searches(params[:search])
        @all_ranks = Lessonkyo.find(Likekyo.group(:lessonkyo_id).order('count(lessonkyo_id) desc').limit(50).pluck(:lessonkyo_id))
    end
    def show
        @lessonkyo = Lessonkyo.find params[:id]
        @like = Likekyo.new
        @lessonkyos = Lessonkyo.where(title:@lessonkyo.title,teacher_name:@lessonkyo.teacher_name).order("created_at ASC") 
        @all_ranks = Lessonkyo.find(Likekyo.group(:lessonkyo_id).order('count(lessonkyo_id) desc').limit(50).pluck(:lessonkyo_id))
    end
    def ranking
        
    end
    private
    def lessonkyo_params
        params.require(:lessonkyo).permit(:teacher_name, :title, :body)
    end
end
