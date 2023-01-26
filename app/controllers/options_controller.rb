class OptionsController < ApplicationController
  before_action :set_option, only: %i[edit update destroy preferred cancel_preference]

  def new
    @query = Query.find(params[:query_id])
    @option = @query.options.build
  end  

  def create
    @query = Query.find(params[:query_id])
    @option = @query.options.new(option_params)
    if @option.save
      redirect_to query_path(@query)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @option.update(option_params)
      redirect_to query_path(@option.query)
    else
      render 'edit'
    end
  end

  def destroy
    @query = params[:query_id]
    @option.destroy
    redirect_to query_path(@query)
  end

  # def mark_as_preferred
  #   @query = Query.find(params[:query_id])
  #   @options = Option.where(query_id: @query.id)
  #   if @option
  #     @options.update_all(preferred: false)
  #     @option = @options.find(params[:id])
  #     @option.update(preferred: true)
  #     redirect_to query_path(params[:query_id])
  #   else
  #       redirect_to query_path(params[:query_id]), notice: "Option not found"
  #   end
  # end
  
  # def cancel_preference
  #   @options = Option.where(query_id: params[:query_id])
  #   if @options.count > 0
  #       @options.update_all(preferred: false)
  #       redirect_to query_path(params[:query_id])
  #   else
  #       redirect_to query_path(params[:query_id]), notice: "Options not found"
  #   end
  # end

  private

  def set_option
    @option = Option.find_by(query_id: params[:query_id], id: params[:id])
  end

  def option_params
    params.require(:options).permit(:content, :query_id, :preferred)
  end
end
