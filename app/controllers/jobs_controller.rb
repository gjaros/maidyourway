class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  before_action :create_calender, only: :index

  authorize_resource

  include JobsHelper

  # GET /jobs
  def index
    @jobs = Job.all
  end

  def create_calender

    @calender_days = []
    current_time = Date.parse(params[:current_time])

    month_sub_one = current_time.month - 1
    month_add_one = current_time.month + 1

    # finds the first day of the calender for the current month
    until (current_time.strftime('%A') == 'Sunday') && (current_time.day == 1 || current_time.month == month_sub_one)
      if current_time.day == 1
        current_time = current_time.advance(months: -1)
        current_time = current_time.change(day: Time.days_in_month(current_time.month))
      end
      current_time = current_time.advance(days: -1)
    end

    # fills calender for current month
    until @calender_days.length == 35
      @calender_days.push(current_time)
      current_time = current_time.advance(days: 1)
    end

  end

  # GET /jobs/1
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  def create
    @job = Job.new(job_params)

    respond_to do |format|
      if @job.save
        format.html { redirect_to @job, notice: 'Job was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /jobs/1
  def update
    respond_to do |format|
      if @job.update(job_params)
        format.html { redirect_to @job, notice: 'Job was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /jobs/1
  def destroy
    @job.destroy
    respond_to do |format|
      format.html { redirect_to jobs_url, notice: 'Job was successfully destroyed.' }
    end
  end

  private
    def set_job
      @job = Job.find(params[:id])
    end

    def job_params
      params.require(:job).permit(:name, :datetime, :created_by, :client_id, :notes, :workers)
    end
end
