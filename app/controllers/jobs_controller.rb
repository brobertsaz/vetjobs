class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :verify_employer, only: [:create, :update, :delete]
  before_action :set_job, only: [:show, :update, :delete]

  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def create
    @job = current_user.jobs.create job_params
    if @job.save
      flash[:success] = 'Successfully created job'
      redirect_to @job
    else
      flash[:error] = 'Unable to create job'
      render :new
    end
  end

  def show
  end

  private

  def job_params
    params.require(:job).permit(:title, :location, :position_type, :description, :low_salary, :high_salary)
  end

  def set_job
    @job = Job.find params[:id]
  end

  def verify_employer
    current_user.is_employer?
  end
end
