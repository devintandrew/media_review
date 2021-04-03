class ContentsController < ApplicationController
  before_action :set_content, only: %i[ show edit update destroy ]

  # GET /contents or /contents.json
  def index
    if current_user.nil?
      if params[:search_param]
        @contents = Content.where('content_type ilike ?', "%#{params[:search_param]}%")
      elsif params[:search_param2]
        @contents = Content.where('content_type ilike ?', "%#{params[:search_param2]}%")
      else
        @contents = Content.all
      end
    else
   
      if params[:search_param]
        @contents = Content.where('content_type ilike ?  and user_id = ?', "%#{params[:search_param]}%", current_user)
      elsif params[:search_param2]
        @contents = Content.where('content_type ilike ? and user_id = ?', "%#{params[:search_param2]}%", current_user)
      else
        @contents = Content.where('user_id = ?', current_user)
        
      end
    end

  end

  # GET /contents/1 or /contents/1.json
  def show
  end

  # GET /contents/new
  def new
    @content = Content.new
  end

  # GET /contents/1/edit
  def edit
  end

  # POST /contents or /contents.json
  def create
    @content = Content.new(content_params)
    @content.user = current_user

    respond_to do |format|
      if @content.save
        format.html { redirect_to @content, notice: "Content was successfully created." }
        format.json { render :show, status: :created, location: @content }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contents/1 or /contents/1.json
  def update
    respond_to do |format|
      if @content.update(content_params)
        format.html { redirect_to @content, notice: "Content was successfully updated." }
        format.json { render :show, status: :ok, location: @content }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @content.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /contents/1 or /contents/1.json
  def destroy
    @content.destroy
    respond_to do |format|
      format.html { redirect_to contents_url, notice: "Content was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_content
      @content = Content.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def content_params
      params.require(:content).permit(:content_type, :title, :content_review_notes, :rating, :movie_link, :release_date)
    end
end
