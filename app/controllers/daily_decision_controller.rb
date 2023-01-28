class DailyDecisionController < ApplicationController
    def create
        @daily_decision = current_user.daily_decisions.create(query_id: params[:query_id])
        redirect_to @daily_decision
    end

    def update
    end

    def index
    end

    def show
        @daily_decision = current_user.daily_decisions.sample
        if @daily_decision.present?
          @random_option = Option.random_option(@daily_decision.query_id)
        else
          redirect_to root_path, notice: "You don't have any daily decision yet. Please add some."
        end
    end
end
