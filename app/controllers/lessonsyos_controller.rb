class LessonsyosController < ApplicationController
    before_action :authenticate_user!
    def index
        @lessonsyos=Lessonsyo.page(params[:page]).per(8).order("created_at DESC") 
        @all_ranks = Lessonsyo.find(Like.group(:lessonsyo_id).order('count(lessonsyo_id) desc').limit(50).distinct.pluck(:lessonsyo_id))
    end
    def new
        @lessonsyo=Lessonsyo.new

    end
    def create
        @lessonsyo = Lessonsyo.new(lessonsyo_params)
        @lessonsyo.user_id = current_user.id
    if @lessonsyo.save
      flash[:update] = "lessonsyo was successfully created."
      redirect_to lessonsyos_path
    else 
      @lessonsyos = Lessonsyo.all
      render'new'
    end
    end
    def search
        @lessonsyos = Lessonsyo.search(params[:search])
        @all_ranks = Lessonsyo.find(Like.group(:lessonsyo_id).order('count(lessonsyo_id) desc').limit(50).distinct.pluck(:lessonsyo_id))
    end
    def searches
        @lessonsyos = Lessonsyo.searches(params[:search])
        @all_ranks = Lessonsyo.find(Like.group(:lessonsyo_id).order('count(lessonsyo_id) desc').limit(50).distinct.pluck(:lessonsyo_id))
    end
    def show
        @lessonsyo = Lessonsyo.find params[:id]
        @like = Like.new
        @lessonsyos = Lessonsyo.where(title:@lessonsyo.title).order("created_at ASC") 
        @all_ranks = Lessonsyo.find(Like.group(:lessonsyo_id).order('count(lessonsyo_id) desc').limit(50).distinct.pluck(:lessonsyo_id))
    end
    def ranking
        
    end
    private
    def lessonsyo_params
        params.require(:lessonsyo).permit(:teacher_name, :title, :body)
    end
end
