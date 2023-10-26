class PagesController < ApplicationController
  before_action :find_user, only: [:followers, :following, :profile]
  def home
  end

  def edit_personal_details;
  end

  def update_personal_details
    @user = current_user
    respond_to do |format|
      if @user.update(user_details)
          format.turbo_stream { flash.now[:notice] = "User was successfully updated." }
      end
    end
  end
  
  def profile
  end

  def notification
    if current_user
      @notifications = current_user.notifications.reverse
      current_user.notifications.mark_as_read!
    end
  end

  def notification_reqs
  end

  def follower_posts
    @users = current_user.following.all
  end

  def followers
    @followers = @user.followers.all
  end

  def following
    @following = @user.following.all
  end
  
  private

  def find_user
    @user = User.find(params[:id])
  end

  def user_details
    params.require(:user).permit(:image)
  end
end
