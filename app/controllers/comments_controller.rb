class CommentsController < ApplicationController
    def create
        @comments = Comment.create(comment: comment_params[:comment], question_id: comment_params[:question_id], user_id: current_user.id)
        redirect_to "/questions/#{@comments.question.id}"
    end
    
    private
    
    def comment_params
        params.permit(:comment, :question_id)
    end
end
