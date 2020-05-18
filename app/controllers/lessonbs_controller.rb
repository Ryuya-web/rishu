class LessonbsController < ApplicationController
    before_action :authenticate_user!
    def index
        @lessonbs=Lessonb.page(params[:page]).per(8).order("created_at DESC") 
        @all_ranks = Lessonb.find(Likeb.group(:lessonb_id).order('count(lessonb_id) desc').limit(50).distinct.pluck(:lessonb_id))
    end
    def new
        @lessonb=Lessonb.new

    end
    def create
        @lessonb = Lessonb.new(lessonb_params)
        @lessonb.user_id = current_user.id
    if @lessonb.save
      flash[:update] = "lessonb was successfully created."
      redirect_to lessonbs_path
    else 
      @lessonbs = Lessonb.all
      render'new'
    end
    end
    def search
        @lessonbs = Lessonb.search(params[:search])
        @all_ranks = Lessonb.find(Likeb.group(:lessonb_id).order('count(lessonb_id) desc').limit(50).distinct.pluck(:lessonb_id))
    end
    def searches
        @lessonbs = Lessonb.searches(params[:search])
        @all_ranks = Lessonb.find(Likeb.group(:lessonb_id).order('count(lessonb_id) desc').limit(50).distinct.pluck(:lessonb_id))
    end
    def show
        @lessonb = Lessonb.find params[:id]
        @like = Likeb.new
        @lessonbs = Lessonb.where(title:@lessonb.title).order("created_at ASC") 
        @all_ranks = Lessonb.find(Likeb.group(:lessonb_id).order('count(lessonb_id) desc').limit(50).distinct.pluck(:lessonb_id))
    end
    def ranking
        
    end
    private
    def lessonb_params
        params.require(:lessonb).permit(:teacher_name, :title, :body)
    end
end
