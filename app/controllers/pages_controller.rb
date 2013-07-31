class PagesController < ApplicationController
  def index
    params[:per_page] ||= 25
    params[:page]     ||= 1

    @links = Link.order('created_at DESC').page(params[:page]).per_page(params[:per_page])
  end

  def search
    params[:per_page] ||= 25
    params[:page]     ||= 1

    @search = Link.search(params[:q], params) #gives info about pagination, total matches, etc
    @links = @search.results
    render 'index'
  end

end
