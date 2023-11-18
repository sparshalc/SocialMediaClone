module ApplicationHelper
  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end

  def users_not_followed
    User.where.not(id: current_user.following_ids).where.not(id: current_user.id) 
  end

  def post_notifications
    current_user.notifications.count
  end
  
  def connection_notifications
    current_user.follow_requests.count
  end

  def choose_path(post)
    if post_index_path
      list_comments_path(post)
    else
     post_path(post)
    end
  end

  def stimulus_controller
    if post_index_path
      "bs-modal"
    else
      "focus-comment"
    end
  end

  def post_index_path
    params[:controller] == "posts" && params[:action] == "index"
  end
end
