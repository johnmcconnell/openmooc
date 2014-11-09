class ActivitiesController < ApplicationController
  before_action :set_activity, only: [ :show ]
  respond_to :html

  def show
  end

  private

    def set_activity
      id = params[:id]
      @activity = Activity.find(id)
    end
end
