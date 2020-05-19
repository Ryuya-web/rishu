class LessonsosController < ApplicationController
    before_action :authenticate_user!
    def index
        @lessonsos=Lessonso.page(params[:page]).per(8).order("created_at DESC") 
        @all_ranks = Lessonso.find(Likeso.group(:lessonso_id).order('count(lessonso_id) desc').limit(50).distinct.pluck(:lessonso_id))
    end
    def new
        @lessonso=Lessonso.new

    end
    def create
        @lessonso = Lessonso.new(lessonso_params)
        @lessonso.user_id = current_user.id
    if @lessonso.save
      flash[:update] = "lessonso was successfully created."
      redirect_to lessonsos_path
    else 
      @lessonsos = Lessonso.all
      render'new'
    end
    end
    def search
        @lessonsos = Lessonso.search(params[:search])
        @all_ranks = Lessonso.find(Likeso.group(:lessonso_id).order('count(lessonso_id) desc').limit(50).distinct.pluck(:lessonso_id))
    end
    def searches
        @lessonsos = Lessonso.searches(params[:search])
        @all_ranks = Lessonso.find(Likeso.group(:lessonso_id).order('count(lessonso_id) desc').limit(50).distinct.pluck(:lessonso_id))
    end
    def show
        @lessonso = Lessonso.find params[:id]
        @like = Likeso.new
        @lessonsos = Lessonso.where(title:@lessonso.title,teacher_name:@lessonso.teacher_name).order("created_at ASC") 
        @all_ranks = Lessonso.find(Likeso.group(:lessonso_id).order('count(lessonso_id) desc').limit(50).distinct.pluck(:lessonso_id))
    end
    def ranking
        
    end
    private
    def lessonso_params
        params.require(:lessonso).permit(:teacher_name, :title, :body)
    end
end
