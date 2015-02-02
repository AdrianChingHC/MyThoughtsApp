class ThoughtsController < ApplicationController
	include SessionsHelper

	def index
		@thoughts = current_user.thoughts.paginate(page: params[:page])
	end
end
