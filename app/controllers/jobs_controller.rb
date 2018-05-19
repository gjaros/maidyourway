class JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!

  authorize_resource

  # GET /jobs
  def index
    @jobs = Job.all

    @calender_days = []

    day = Time.now.day
    month = Time.now.month
    month_minus_one = month - 1
    month_plus_one = month + 1

    # finds the first day of the calender for the current month
    until (Time.new.change(day: day, month: month).strftime('%A') == 'Sunday') && (day == 1 || month == month_minus_one)
      if day == 1
        month -= 1
        day = Time.days_in_month(month_minus_one)
      end
      day -= 1
    end

    # fills calender for current month
    until @calender_days.length == 35 && month == month_plus_one
      @calender_days.push(Time.new.change(day: day, month: month))
      if day == Time.days_in_month(month)
        month += 1
        day = 0
      end
      day += 1
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
