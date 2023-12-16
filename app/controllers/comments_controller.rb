class CommentsController < ApplicationController
  def create
    workpost = Workpost.find(params[:workpost_id])
    comment = workpost.comments.build(comment_params)
    if comment.save
      flash[:success] = 'commentしました。'
      redirect_to workpost_path(workpost)
    else
      flash[:success] = 'comment失敗。'
      redirect_to workpost_path(workpost)
    end
  end

  def destroy
    @workpost = Workpost.find(params[:workpost_id])
    @workpost_comments = @workpost.comments
    Comment.find_by(id: params[:id], workpost_id: params[:workpost_id]).destroy
  end
  
  
  private
  
  def comment_params
    params.require(:comment).permit(:content, :image)
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
