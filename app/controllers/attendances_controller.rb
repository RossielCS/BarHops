class AttendancesController < ApplicationController
  include AttendancesHelper
  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = current_user.attendances.new(attendance_params)

    if @attendance.save
      flash[:notice] = 'Attendance created successfully.'
    else
      flash[:notice] = 'Attendance couldn\'t be created.'
    end
    redirect_to current_user
  end

  def index
    @attendances = attn_with_group
    @total = 0
  end

  def show; end

  def external_attendances
    @attendances = attn_without_group
    @total = 0
  end

  private

  def attendance_params
    params.require(:attendance).permit(:name, :amount, :group_id)
  end
end
