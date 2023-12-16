class SendsController < ApplicationController
  def create
    workpost = Workpost.find(params[:workpost_id])
    send = current_user.sends.build(send_params)
    send.workpost_id = workpost.id
    send.save
    
    if send.save
      flash[:success] = 'コメントを投稿しました。'
      redirect_to workpost_path(workpost)
    else
      flash.now[:danger] = 'コメントの投稿に失敗しました。'
      render 'toppages/index'
    end
  end

  def destroy
  end
  
   private

  def send_params
    params.require(:send).permit(:content)
  end
  
  
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
  
end
