class UsersController < ApplicationController
  def index
    @user = User.all[0]
  end

  def show; end
end
