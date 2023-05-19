# frozen_string_literal: true

module Admin
  class UserManagementsController < ApplicationController
    def index
      @users = User.all
    end

    def show
      @user = User.find(params[:id])
    end

    def destroy
      User.find(params[:id]).update(deleted: true)
      redirect_to admin_user_managements_path
    end
  end
end
