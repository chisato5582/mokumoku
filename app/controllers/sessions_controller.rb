# frozen_string_literal: true

class SessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      session[:user_id] = @user.id
      redirect_back_or_to events_path, success: 'ログインしました'
    else
      flash.now[:danger] = 'ログインに失敗しました'
      render :new
    end
  end

  def destroy
    logout
    redirect_to login_path
  end
end
