class DailyDecisionsController < ApplicationController
  before_action :authenticate_user!

  def create
    query = Query.find(params[:query_id])
    if user_signed_in?
      @daily_decision_list = current_user.daily_decision_list || current_user.create_daily_decision_list
    else
      redirect_to new_user_session_path, alert: "Please sign in to add query to Daily Decisions."
    end
    daily_decision = DailyDecision.create(query: query, daily_decision_list: @daily_decision_list)
    if daily_decision.save
      redirect_to query, notice: 'Query added to Daily Decisions.'
    else
      redirect_to query, alert: daily_decision.errors.full_messages
    end
  end

  private

  def daily_decision_params
    params.require(:daily_decision).permit(:query_id, :daily_decision_list_id)
  end
end