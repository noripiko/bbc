class QuestionsController < ApplicationController
	
	before_action :login_check, only: [:new, :create, :destroy]
	
	def index
		@question = Question.includes(:user).page(params[:page]).per(6).order("created_at DESC")
		# @comments = @question.id.comments.includes(:user)
	end

	def new
	end

	def show
		@question = Question.find(params[:id])
		@comments = @question.comments.includes(:user)
	end

	def create
		Question.create(word: question_params[:word], group: question_params[:group], text: question_params[:text], user_id: current_user.id)
		redirect_to '/'
	end

	def destroy
		question = Question.find(params[:id])
        question.destroy if question.user_id == current_user.id
        redirect_to :action => "index"
	end

	private

	def question_params
		params.permit(:word, :group, :text)
	end
	
	def login_check
	  unless user_signed_in?
	    flash[:alert] = "ログインしてください"
	    redirect_to root_path
	  end
	end
end
