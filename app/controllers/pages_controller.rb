class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def subscribe
    @user = current_user

    if @user.save
      flash.now[:notice] = "Awesome! #{@user.email} will now receive daily project reminders"
      render "index"
    else
      flash.now[:alert] = "Apologies! We couldn't subscribe #{@user.email}.."
      render "index"
    end
  end

  def unsubscribe
    @user = current_user

    unless @user
      flash[:notice] = "This user was already unsubscribed"
      redirect_to root_path
    end
  end
end
