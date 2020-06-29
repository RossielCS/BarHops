class GroupsController < ApplicationController
  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      flash[:notice] = 'Group created successfully.'
    else
      flash[:notice] = 'Group couldn\'t be created.'
    end
    redirect_to @group
  end

  def index
    @groups = Group.all
  end

  def show
    @group = Group.where(id: group_params[:id])
  end

  private

  def group_params
    require(:group).permit(:id, :name)
  end
end
