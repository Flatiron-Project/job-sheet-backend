class JobsController < ApplicationController
  before_action :redirect_if_not_logged_in

    def new
      @job = Job.new
    end

    def create
      @job = current_user.Jobs.build(job_params)
      if @job.save
        redirect_to jobs_path
      else
        render new
      end
    end

    def index
      if params[:user_id] && @user = User.find_by_id(params[:user_id])
        @jobs = @user.Jobs.alpha
      else
        @error = "That user doesn't exist" if params[:Job_id]
        @jobs = Job.alpha
      end
    end

    def show
      @job = Job.find_by_id(params[:id])
      redirect_to jobs_path if !@job
    end

    def destroy
      Job.delete(job_params)
      redirect_to jobs_path
    end
    
    private

    def job_params
      params.require(:Job).permit(:title, :content)
    end
end
