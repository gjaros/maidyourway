class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy, :schedule]
  before_action :authenticate_user!
  before_action :authorize_admin, only: [:create, :edit, :update]

  authorize_resource

  include UserHelper

  # GET /users
  def index
    @users = User.all
  end

  # creates array filled with job objects for specific worker
  def schedule
    @jobs = []
    @current_week = Time.now

    until @current_week.strftime('%A') == 'Sunday' do
      @current_week = @current_week.advance(days: -1)
    end

    Job.all.order(:datetime).each do |job|
      if job.workers.include?(@user.id)
        if job.datetime > @current_week.at_beginning_of_day() && job.datetime < @current_week.advance(days: 6).at_end_of_day()
          @jobs.push(job)
        end
      end
    end

  end

  # GET /users/1
  def show
    @jobs = Job.all
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to users_path(@user), notice: 'User was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /users/1
  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end
    
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to users_path(@user), notice: 'User was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
    end
  end

  private
    def set_user
      @user = User.find(params[:id])
    end

    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation, :role, :name, :street, :city, :zip, :state, :username, :avatar, :phone)
    end
end
