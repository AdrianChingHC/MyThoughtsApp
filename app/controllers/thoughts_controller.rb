class ThoughtsController < ApplicationController
	include SessionsHelper
	before_action :logged_in_user, only: [:create, :destroy, :update]
	before_action :correct_user,   only: [:destroy, :update]

	def index
		@thoughts = current_user.thoughts.paginate(page: params[:page], per_page: 10)

	end

	def new
		if logged_in?
			@thought = current_user.thoughts.build 
			@feed_items = current_user.feed.paginate(page: params[:page], per_page: 10)
		end
	end

	def create
		@thought = current_user.thoughts.build(thought_params)
    if @thought.save
      flash[:success] = "Thought successfully saved!"
      redirect_to thoughts_path
    elsif params[:thought][:content].blank?
    	flash[:danger] = "Please input your thoughts before saving."
    	redirect_to thoughts_path
    elsif params[:thought][:content].length > 250
    	flash[:danger] = "Thoughts cannot be more than 250 characters."
    	redirect_to thoughts_path
    else
    	render :new
    end
	end

  def update
    if @thought.update(thought_params)
      respond_to do |format|
        format.html { redirect_to thoughts_path }
        format.json { respond_with_bip(@thought) }
      end
    else
      format.html { render :action => "new" }
      format.json { respond_with_bip(@thought) }
    end
  end


	def destroy
		@thought.destroy
    flash[:success] = "Thought successfully deleted"
    redirect_to request.referrer || root_url
	end

	private

    def thought_params
      params.require(:thought).permit(:content)
    end

    def correct_user
      @thought = current_user.thoughts.find_by(id: params[:id])
      redirect_to root_url if @thought.nil?
    end
end
