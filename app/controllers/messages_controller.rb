class MessagesController < ApplicationController
  def create
    @message = current_workpost.messages.build(message_params)
    if @message.save
      flash[:success] = 'メッセージを投稿しました。'
      redirect_to root_url
    else
      @pagy, @messages = pagy(current_user.messages.order(id: :desc))
      flash.now[:danger] = 'メッセージの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
  end
  
  private
  
  def message_params
    params.require(:message).permit(:content)
  end
  
  def current_workpost
    @current_work ||= Workpost.find_by(id: session[:user_id])
  end
  
  
end
