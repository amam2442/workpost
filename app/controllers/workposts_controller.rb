class WorkpostsController < ApplicationController
  def index
  end

  def show
    @workpost = Workpost.find(params[:id])
    @send = Send.new
    @sendcomment = Send.where(workpost_id: params[:workspost_id]) 
    @sending = @workpost.sends
    @sendall = Send.all
  end

  def new
    @workpost = Workpost.new
  end

  def create
    @workpost = current_user.workposts.build(workpost_params)
    if @workpost.save
      flash[:success] = '案件を投稿しました。'
      redirect_to root_url
    else
      @pagy, @workposts = pagy(current_user.workposts.order(id: :desc))
      flash.now[:danger] = '案件投稿に失敗しました。'
      render 'toppages/index'
    end
    
  end

  def edit
  end

  def update
  end

  def destroy
  end
  
  private
  
  def workpost_params
    params.require(:workpost).permit(:content, :imageurl)
  end
  
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end
end
