class StudentCommentRatingsController < ApplicationController
  before_action :set_category_paper_comment
  before_action :set_comment

  def index
    @student_comment_ratings = @comment.student_comment_ratings
  end

  def new

  end

  def edit

  end

  def update

  end

  def create
    @student_comment_rating = current_student.student_comment_ratings.find_or_initialize_by(comment_id: params[:comment_id])
    @student_comment_rating.rating = params[:rating]
    respond_to do |format|
      if @student_comment_rating.save
        format.html { redirect_to category_paper_path(@category, @paper), notice: "student comment rating was successfully created." }
        format.json { redirect_to category_paper_path(@category, @paper), status: :created, location: @user_comment_rating }
      else
        format.html { redirect_to topic_post_path(@topic, @post), notice: "User has already rating that comment ." }
        format.json { render json: @user_comment_rating.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_category_paper_comment
    @category = Category.find_by(id: params[:category_id])
    @paper = @category.papers.find_by(id: params[:paper_id])
  end

  def set_comment
    @comment = @paper.comments.find_by(id: params[:comment_id])
  end

  def student_comment_rating_params
    params.require(:student_comment_rating).permit(:rating, :comment_id)
  end
end