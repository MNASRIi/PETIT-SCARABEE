class LessonsController < ApplicationController
  def index
    if params[:query].present?
      @query = params[:query]
      @lessons = Lesson.where("name LIKE ?", "%#{params[:query]}%")
    else
      @lessons = policy_scope(Lesson)
    end
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to lessons_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
  end

  def edit
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:category, :title, :description, :price, :duration)
  end
end
