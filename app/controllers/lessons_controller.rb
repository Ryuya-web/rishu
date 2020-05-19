class LessonsController < ApplicationController
    before_action :authenticate_user!
    def index
        @lessons=Lesson.page(params[:page]).per(8).order("created_at DESC") 
        @all_ranks = Lesson.find(Like.group(:lesson_id).order('count(lesson_id) desc').limit(50).distinct.pluck(:lesson_id))
    end
    def new
        @lesson=Lesson.new

    end
    def create
        @lesson = Lesson.new(lesson_params)
        @lesson.user_id = current_user.id
    if @lesson.save
      flash[:update] = "lesson was successfully created."
      redirect_to lessons_path
    else 
      @lessons = Lesson.all
      render'new'
    end
    end
    def search
        @lessons = Lesson.search(params[:search])
        @all_ranks = Lesson.find(Like.group(:lesson_id).order('count(lesson_id) desc').limit(50).distinct.pluck(:lesson_id))
    end
    def searches
        @lessons = Lesson.searches(params[:search])
        @all_ranks = Lesson.find(Like.group(:lesson_id).order('count(lesson_id) desc').limit(50).distinct.pluck(:lesson_id))
    end
    def show
        @lesson = Lesson.find params[:id]
        @like = Like.new
        @lessons = Lesson.where(title:@lesson.title,teacher_name:@lesson.teacher_name).order("created_at ASC") 
        @all_ranks = Lesson.find(Like.group(:lesson_id).order('count(lesson_id) desc').limit(50).distinct.pluck(:lesson_id))
    end
    def ranking
        
    end
    private
    def lesson_params
        params.require(:lesson).permit(:teacher_name, :title, :body)
    end
end
