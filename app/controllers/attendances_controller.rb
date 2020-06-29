class AttendancesController < ApplicationController
  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = Attendance.new(attendance_params)
    @attendance.author_id = current_user.id
    if @attendance.save
      flash[:notice] = 'Attendance created successfully.'
    else
      flash[:notice] = 'Attendance couldn\'t be created.'
    end
    redirect_to attendances_path
  end

  def index
    @attendances = Attendance.all
  end

  def show; end

  private

  def attendance_params
    require(:attendance).permit(:name, :amount)
  end
end
