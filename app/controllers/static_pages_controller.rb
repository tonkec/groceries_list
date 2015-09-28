class StaticPagesController < ApplicationController
  def home
    @user = User.new
    @groceries = current_user.groceries.paginate(page: params[:page], :per_page => 4)
  end

  def about
  end
end
