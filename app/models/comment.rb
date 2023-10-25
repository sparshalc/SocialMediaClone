class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  has_noticed_notifications
  after_create_commit { broadcast_notification }

  private

  def broadcast_notification
    return if user == post.user

    CommentNotification.with(message: self).deliver_later(post.user)

    broadcast_prepend_to "notifications_#{post.user.id}",
                          target: "notifications_#{post.user.id}",
                          partial: 'notifications/notification',
                          locals: { user:, post:, unread: true}
  end
end
