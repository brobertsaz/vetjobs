class JobApplicationsController < ApplicationController
  before_action :authenticate_user!

  def create
    job_application = JobApplication.create job_application_params

    if job_application.save
      flash[:success] = 'Successfully applied'
      redirect_to jobs_path
    else
      flash[:error] = 'Unable to apply for that job'
      redirect_to :back
    end
  end

  private

  def job_application_params
    params.permit(:job_id, :user_id)
  end
end