class PapersController < ApplicationController
  load_and_authorize_resource
  skip_before_action :verify_authenticity_token, only: :read_status
  before_action :set_category
  before_action :set_paper, only: %i[ show edit update destroy read_status]

  # GET /papers or /papers.json
  def index
    @end_date = params[:to_date].present? ? params[:to_date] : Time.now
    @start_date = params[:from_date].present? ? params[:from_date] : @end_date - 1.day
    if @category.present?
      @papers = @category.papers.all
    else
      @papers = Paper.all
    end
    @pagy, @papers = pagy(@papers.includes(:category, :comments).between_dates(@start_date, @end_date), items: 10)
  end

  # GET /papers/1 or /papers/1.json
  def show
    @student_comment_rating = StudentCommentRating.new
  end

  # GET /papers/new
  def new
    @paper = Paper.new
  end

  # GET /papers/1/edit
  def edit
  end

  # POST /papers or /papers.json
  def create
    @paper = Paper.new(paper_params)
    @paper.student_id = current_student.id

    respond_to do |format|
      if @paper.save
        format.js
        format.html { redirect_to category_paper_path(@category, @paper), notice: "Paper was successfully created." }
        format.json { render :show, status: :created, location: @paper }
      else
        format.js
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /papers/1 or /papers/1.json
  def update
    respond_to do |format|
      if @paper.update(paper_params)
        format.html { redirect_to category_paper_path(@category, @paper), notice: "Paper was successfully updated." }
        format.json { render :show, status: :ok, location: @paper }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @paper.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /papers/1 or /papers/1.json
  def destroy
    @paper.destroy
    respond_to do |format|
      format.html { redirect_to category_papers_url(@category), notice: "Paper was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def read_status
    @student = current_student
    unless @paper.paper_read_status_ids.include? @student.id
      @paper.paper_read_status << @student
    end
  end

  private
  def set_category
    @category = Category.find_by(id: params[:category_id])
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_paper
    @paper = @category.papers.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def paper_params
    params.require(:paper).permit(:name, :category_id, :release_date, :language, :image)
  end
end
