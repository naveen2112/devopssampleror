class RatingsController < ApplicationController
  before_action :set_category_paper

  def create
    @rating = @paper.ratings.new(ratings_params)
    @rating.student_id = current_student.id
    @rating.save!
    redirect_to category_paper_path(@category, @paper), notice: 'Rating was successfully created.'
  end

  private

  def set_category_paper
    @category = Category.find_by(id: params[:category_id])
    @paper = @category.papers.find_by(id: params[:paper_id])
  end

  def ratings_params
    params.require(:rating).permit(:rating)
  end
end