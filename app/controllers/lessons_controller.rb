class LessonsController < ApplicationController
  def index
    skip_policy_scope
    if params[:query].present?
      @query = params[:query]
      @lessons = Lesson.search_by_title_and_category_and_price(params[:query])
    else
      @lessons = Lesson.all
    end
    @markers = @lessons.geocoded.map do |lesson|
      {
        lat: lesson.latitude,
        lng: lesson.longitude,
        info_window_html: "<h5>#{lesson.title}</h5>"
      }
    end
  end

  def new
    @lesson = Lesson.new
    @lesson.user = current_user
    authorize @lesson
  end

  def create
    @lesson = Lesson.new(lesson_params)
    @lesson.user = current_user
    authorize @lesson
    @lesson.save!
    if @lesson.save
      redirect_to dashboard_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    set_lesson
    @booking = Booking.new
    @booking.lesson = @lesson
    authorize @lesson
  end

  def destroy
    @lesson = Lesson.find(params[:id])
    authorize @lesson
    @lesson.destroy
    redirect_to dashboard_path
  end

  def edit
    @lesson = Lesson.find(params[:id])
    authorize @lesson
  end

  def update
    @lesson = Lesson.find(params[:id])
    @lesson.update(lesson_params)
    @lesson.user = current_user
    authorize @lesson
    redirect_to dashboard_path
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:category, :title, :description, :price, :duration, :photo, :address)
  end
end
