# frozen_string_literal: true

class Mypage::ProfilesController < Mypage::BaseController
  def show
    @user = if params[:id].blank? || current_user.id == params[:id].to_i
              current_user
            else
              User.find(params[:id])
            end
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(profile_params)
      redirect_to edit_mypage_profile_path, success: 'プロフィールを更新しました'
    else
      render :show
    end
  end

  private

  def profile_params
    params.require(:user).permit(:name, :avatar, :hobby, :profile)
  end
end
