class QueriesController < ApplicationController
  before_action :set_query, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[new edit]
  before_action :set_categories

  # GET /queries or /queries.json
  def index
    @queries = Query.all.order('created_at DESC')
  end

  # GET /queries/1 or /queries/1.json
  def show
    @query = Query.find(params[:id])
    @query_option = @query.query_options.build
    @option = @query_option.build_option
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
        format.html { redirect_to query_url(@query), notice: 'Query was successfully created.' }
        format.json { render :show, status: :created, location: @query }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @query.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /queries/1 or /queries/1.json
  def update
    @query = Query.find(params[:id])
    @query.category_id = params[:category_id]
    # Create a new option for the query through the query_options association
    # Option.create(content: params[:query][:query_option][:option][:content],
    # preferred: params[:query][:query_option][:option][:preferred])

    @query_option = @query.query_options.build(option_attributes:
      { query_id: @query.id,
        content: params[:query][:query_option][:option][:content],
        preferred: params[:query][:query_option][:option][:preferred] })

    if @query_option.save
      redirect_to query_url(@query), notice: 'Option was successfully Added.'
    else
      render :edit, status: :unprocessable_entity
    end

    # respond_to do |format|
    #   if @query.update(query_params)
    #     format.html { redirect_to query_url(@query), notice: 'Query was successfully updated.' }
    #     format.json { render :show, status: :ok, location: @query }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @query.errors, status: :unprocessable_entity }
    #   end
    # end
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
  # Unpermitted parameter: :options. Context: { controller: QueriesController, action: update, request: #<ActionDispatch::Request:0x00007f1c29a5f180>, params: {"_method"=>"patch", "authenticity_token"=>"[FILTERED]", "query"=>{"options"=>{"content"=>"test", "preferred"=>"0"}}, "commit"=>"Add option", "controller"=>"queries", "action"=>"update", "id"=>"2"} }

  #   <%= form_with model: @query do |f| %>
  #   <%= f.fields_for @query.options.build do |option_form| %>
  #     <%= option_form.label :content %>
  #     <%= option_form.text_field :content %>
  #     <%= option_form.check_box :preferred %>
  #     <%= option_form.submit "Add option" %>
  #   <% end %>
  # <% end %>

  def query_params
    params.require(:query).permit(:title, :situation, :category_id, :id, query_options_attribute:
      [:id, { option_attributes: %i[id content preferred _destroy] }])
  end

  def set_categories
    @categories = Category.all.order(:name)      
  end
end
