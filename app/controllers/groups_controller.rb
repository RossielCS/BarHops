class GroupsController < ApplicationController
  include GroupsHelper
  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    @group.group_avatar.attach(group_params[:group_avatar])
    if @group.save
      flash[:success] = 'Group created successfully.'
    else
      flash[:danger] = 'Group could not be created.'
    end
    redirect_to groups_path
  end

  def index
    @groups = Group.group_alphabetical_order
  end

  def show
    @group = Group.where(id: params[:id]).first
  end

  private

  def group_params
    params.require(:group).permit(:user_id, :name, :group_avatar)
  end
end
