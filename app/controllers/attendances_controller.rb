class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = current_user.attendances.new(attendance_params)
    if @attendance.save
      flash[:success] = 'Attendance created successfully.'
      redirect_to current_user
    else
      flash[:danger] = 'Attendance couldn\'t be created.'
      render 'new'
    end
  end

  def index
    @attendances = Attendance.attn_with_group(current_user)
  end

  def show; end

  def external_attendances
    @attendances = Attendance.attn_without_group(current_user)
  end

  private

  def attendance_params
    params.require(:attendance).permit(:name, :amount, :group_id)
  end
end
