class Admin::ReviewsController < ApplicationController
  attr_reader :review
  before_action :authenticate_admin!
  before_action :set_review, only: %i[ show edit update destroy, ]
  # GET /reviews or /reviews.json
  def index
    @reviews = Review.all.order("reviews.created_at desc")
  end

  # GET /reviews/1 or /reviews/1.json
  def show
    @review = Review.find(params[:id])
  end

  # GET /reviews/new


  # GET /reviews/1/edit
  def edit
  end

  # POST /reviews or /reviews.json
  def create
    @review = Review.new(review_params)

    respond_to do |format|
      if @review.save
        format.html { redirect_to review_url(@review), notice: "Review was successfully created." }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1 or /reviews/1.json
  def update
    # @review
    respond_to do |format|
      if @review.update(review_params)
        format.html { redirect_to review_url(@review), notice: "Review was successfully updated." }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1 or /reviews/1.json
  def destroy
    @review.destroy

    respond_to do |format|
      format.html { redirect_to reviews_url, notice: "Review was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def toggle_status
    @review = Review.find(params[:id])
    if @review.pended?
      @review.published!
    elsif @review.published?
      @review.pended!
    end

    redirect_to admin_reviews_url, notice: 'Review status has been updated.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def review_params
      params.require(:review).permit(:author_name, :author_email, :body, :toggle_status)
    end
end
