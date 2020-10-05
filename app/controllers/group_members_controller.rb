class GroupMembersController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = Group.find(params[:group_id])
  end

end