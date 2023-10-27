module ApplicationHelper
  def render_turbo_stream_flash_messages
    turbo_stream.prepend "flash", partial: "layouts/flash"
  end

  def users_not_followed
    User.where.not(id: current_user.following_ids).where.not(id: current_user.id) 
  end

  def post_notifications
    current_user.notifications.unread.count
  end
  
  def connection_notifications
    current_user.follow_requests.count
  end
end
