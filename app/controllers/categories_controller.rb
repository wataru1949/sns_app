class CategoriesController < ApplicationController
  
  def index
    @categories = Category.search(params[:keyword])
    respond_to do |format|
      format.html
      format.json
    end
  end
end