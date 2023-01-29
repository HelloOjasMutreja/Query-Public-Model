class DailyDecisionListController < ApplicationController
    def index
        @daily_decision_list = current_user.daily_decision_list
        @queries = @daily_decision_list.queries
    end

    def show
        @daily_decision_list = current_user.daily_decision_list
        @queries_with_options = @daily_decision_list.queries.map do |query|
            { query: query, options: query.options }
        end
    end
end
  