class PagesController < ApplicationController
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
    @user = User.find(params[:id])
  end

  def notification
    if current_user
      @notifications = current_user.notifications.reverse
      current_user.notifications.mark_as_read!
    end
  end

  def notification_reqs
  end
  
  private

  def user_details
    params.require(:user).permit(:image)
  end
end
