class StaticPagesController < ApplicationController
  def home
    @user = User.new
    if current_user
      @groceries = current_user.groceries.paginate(page: params[:page], :per_page => 4)
    end
  end

  def about
  end
end
