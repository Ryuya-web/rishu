class LessonhsController < ApplicationController
    before_action :authenticate_user!
    def index
        @lessonhs=Lessonh.page(params[:page]).per(8).order("created_at DESC") 
        @all_ranks = Lessonh.find(Likeh.group(:lessonh_id).order('count(lessonh_id) desc').limit(50).pluck(:lessonh_id))
    end
    def new
        @lessonh=Lessonh.new

    end
    def create
        @lessonh = Lessonh.new(lessonh_params)
        @lessonh.user_id = current_user.id
    if @lessonh.save
      flash[:update] = "lessonh was successfully created."
      redirect_to lessonhs_path
    else 
      @lessonhs = Lessonh.all
      render'new'
    end
    end
    def search
        @lessonhs = Lessonh.search(params[:search])
        @all_ranks = Lessonh.find(Likeh.group(:lessonh_id).order('count(lessonh_id) desc').limit(50).pluck(:lessonh_id))
    end
    def searches
        @lessonhs = Lessonh.searches(params[:search])
        @all_ranks = Lessonh.find(Likeh.group(:lessonh_id).order('count(lessonh_id) desc').limit(50).pluck(:lessonh_id))
    end
    def show
        @lessonh = Lessonh.find params[:id]
        @like = Likeh.new
        @lessonhs = Lessonh.where(title:@lessonh.title,teacher_name:@lessonh.teacher_name).order("created_at ASC") 
        @all_ranks = Lessonh.find(Likeh.group(:lessonh_id).order('count(lessonh_id) desc').limit(50).pluck(:lessonh_id))
    end
    def ranking
        
    end
    private
    def lessonh_params
        params.require(:lessonh).permit(:teacher_name, :title, :body)
    end
end
