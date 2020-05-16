class LessonsController < ApplicationController
    def index
        @lessons=Lesson.all.order("created_at DESC") 
        @all_ranks = Lesson.find(Like.group(:lesson_id).order('count(lesson_id) desc').limit(10).distinct.pluck(:lesson_id))
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
      render'index'
    end
    end
    def search
        @lessons = Lesson.search(params[:search])
        @teachers = Teacher.where(id:@lessons.pluck(:teacher_id))
    end
    def show
        @lesson = Lesson.find params[:id]
        @like = Like.new
        @lessons = Lesson.where(title:@lesson.title)
        @teachers = Teacher.where(id:@lessons.pluck(:teacher_id))
    end
    private
    def lesson_params
        params.require(:lesson).permit(:teacher_name, :title, :body)
    end
end
