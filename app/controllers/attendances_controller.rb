class AttendancesController < ApplicationController
  include AttendancesHelper
  def new
    @attendance = Attendance.new
  end

  def create
    @attendance = current_user.attendances.new(attendance_params)

    # rubocop:disable Style/ConditionalAssignment
    if @attendance.save
      flash[:notice] = 'Attendance created successfully.'
    else
      flash[:notice] = 'Attendance couldn\'t be created.'
    end
    redirect_to current_user
    # rubocop:enable Style/ConditionalAssignment
  end

  def index
    @attendances = attn_with_group
  end

  def show; end

  def external_attendances
    @attendances = attn_without_group
  end

  private

  def attendance_params
    params.require(:attendance).permit(:name, :amount, :group_id)
  end
end
