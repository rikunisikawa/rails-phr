class UsersController < ApplicationController
  def index
    @name = 10 + 1
    @users = User.all
  end
end