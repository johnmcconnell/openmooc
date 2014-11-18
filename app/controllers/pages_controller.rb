class PagesController < ApplicationController
  before_action :set_page, only: [ :show ]
  respond_to :html

  def show
  end

  private

    def set_page
      id = params[:id]
      @page = Page.find(id)
    end
end
