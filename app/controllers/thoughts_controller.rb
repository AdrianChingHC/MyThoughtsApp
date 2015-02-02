class ThoughtsController < ApplicationController
	include SessionsHelper

	def index
		@thoughts = Thought.paginate(page: params[:page])
	end
end
