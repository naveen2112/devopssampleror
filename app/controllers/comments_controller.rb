class CommentsController < ApplicationController

  before_action :set_category_paper

  def create
    @comment = @paper.comments.new(comments_params)
    respond_to do |format|
      if @comment.save
        format.html { redirect_to category_paper_path(@category, @paper), notice: "Comment was successfully created." }
        format.json { render :show, status: :created, location: @paper }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_category_paper
    @category = Category.find_by(id: params[:category_id])
    @paper = @category.papers.find_by(id: params[:paper_id])
  end

  def comments_params
    params.require(:comment).permit(:comment_text)
  end
end
