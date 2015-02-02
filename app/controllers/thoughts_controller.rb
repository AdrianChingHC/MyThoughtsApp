class ThoughtsController < ApplicationController
	include SessionsHelper
	before_action :logged_in_user, only: [:create, :destroy]

	def index
		@thoughts = current_user.thoughts.paginate(page: params[:page])
	end

	def create
		
	end

	def destroy
		
	end
end
