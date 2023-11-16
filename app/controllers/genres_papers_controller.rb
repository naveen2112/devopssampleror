class GenresPapersController < ApplicationController

  before_action :set_category_paper
  before_action :set_genre

  def create
    @genres_paper = @paper.genres_papers.new(genre_id: @genre.id)
    respond_to do |format|
      if @genres_paper.save
        format.html { redirect_to category_paper_path(@category, @paper), notice: "Genre applied successfully." }
        format.json { render :show, status: :created, location: @paper }
      else
        format.html { redirect_to category_paper_path(@category, @paper), notice: "Genre add failed." }
        format.json { render json: @genres_paper.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_category_paper
    @category = Category.find_by(id: params[:category_id])
    @paper = @category.papers.find_by(id: params[:paper_id])
  end

  def set_genre
    @genre = Genre.find_or_create_by(name: params[:genres_paper][:genre_name].downcase)
  end
end
