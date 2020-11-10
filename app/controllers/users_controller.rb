class UsersController < ApplicationController
  def edit
    # @current_user = current_user
  end
  def update
    # @current_user = current_user
    if current_user.update(user_params)
    # if @current_user.update(user_params)
      redirect_to root_path
      # ルーティングを通ってアクションが行われる/
    else
      render :edit
      # editのビューファイルに差し替えられる
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:email)
  end
end
