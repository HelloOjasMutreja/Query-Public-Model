class QueriesController < ApplicationController
  before_action :set_query, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, only: %i[ new edit ]

  # GET /queries or /queries.json
  def index
    @queries = Query.all.order("created_at DESC")
  end

  # GET /queries/1 or /queries/1.json
  def show
    @query = Query.find(params[:id])
    @options = @query.options
  end

  # GET /queries/new
  def new
    @query = current_user.queries.build
    @options = @query.options.build
  end

  # GET /queries/1/edit
  def edit
  end

  # POST /queries or /queries.json
  def create
    @query = current_user.queries.build(query_params)

    respond_to do |format|
      if @query.save
        format.html { redirect_to query_url(@query), notice: "Query was successfully created." }
        format.json { render :show, status: :created, location: @query }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /queries/1 or /queries/1.json
  def update
    respond_to do |format|
      if @query.update(query_params)
        format.html { redirect_to query_url(@query), notice: "Query was successfully updated." }
        format.json { render :show, status: :ok, location: @query }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /queries/1 or /queries/1.json
  def destroy
    @query.destroy

    respond_to do |format|
      format.html { redirect_to queries_url, notice: "Query was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_query
      @query = Query.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def query_params
      params.require(:query).permit(:title, options_attributes: [:content, :preferred])
    end
end
