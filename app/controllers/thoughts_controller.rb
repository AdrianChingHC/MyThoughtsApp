class ThoughtsController < ApplicationController
	include SessionsHelper

	def index
		@thoughts = current_user.thoughts.paginate(page: params[:page])
	end

	def create
		
	end

	def destroy
		
	end
end
