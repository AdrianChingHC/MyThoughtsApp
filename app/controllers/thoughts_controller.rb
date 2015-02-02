class ThoughtsController < ApplicationController
	include SessionsHelper
	before_action :logged_in_user, only: [:create, :destroy]

	def index
		@thoughts = current_user.thoughts.paginate(page: params[:page], per_page: 10)
		@thought = current_user.thoughts.build if logged_in?
	end

	def create
		@thought = current_user.thoughts.build(thought_params)
    if @thought.save
      flash[:success] = "Thought successfully saved!"
      redirect_to thoughts_path
    else
      render 'thoughts'
    end
	end

	def destroy
		
	end

	private

    def thought_params
      params.require(:thought).permit(:content)
    end
end
