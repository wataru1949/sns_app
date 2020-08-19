class Groups::SearchesController < ApplicationController

  def index
    @groups = Group.group_listing.search(params[:keyword]).page(params[:page])
  end
end
