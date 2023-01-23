class OptionsController < ApplicationController
  before_action :find_option, only: [:edit, :update, :destroy, :preferred, :cancel_preference]

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
    @option.destroy
    redirect_to query_path(@option.query)
  end

  def preferred
    @options = Option.where(query_id: params[:query_id])
    @options.update_all(preferred: false)
    @option.update(preferred: true)
    redirect_to query_path(params[:query_id])
  end

  def cancel_preference
    @options = Option.where(query_id: params[:query_id])
    @options.update_all(preferred: false)
    redirect_to query_path(params[:query_id])
  end

  private
    def find_option
      @option = Option.find(params[:id])
    end

    def option_params
      params.require(:option).permit(:content, :preferred)
    end
end
