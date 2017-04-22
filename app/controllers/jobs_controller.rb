class JobsController < ApplicationController
	def index
		@jobs = Job.all
	end

	def new
		@job = Job.new
	end

	def edit
		@job = Job.find(params[:id])
	end

	def update
		#find the job
		@job = Job.find(params[:id])
		#update the job
		@job.update_attributes(job_params)
		redirect_to jobs_path
	end

	def create
		Job.create(job_params)
		redirect_to jobs_path
	end

	def destroy
		#find the job
		@job = Job.find(params[:id])
		#delete the job
		@job.destroy
		redirect_to jobs_path
	end

	private

	def job_params
	  params.require(:job).permit(:title, :description)
	end
end
