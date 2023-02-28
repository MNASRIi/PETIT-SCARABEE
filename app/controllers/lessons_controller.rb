class LessonsController < ApplicationController
  def index
    @lesson = Lesson.all
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:categry, :title, :description, :price, :descriptiion, :price, :duration)
  end
end
