class NotificationTest < ActiveSupport::TestCase
  context "When a comment is made on a post" do
    it "CommentNotification sends a notification to the creator of the post" do

      commentUser = User.create(email: 'imailsparsha@gmail.com', password: 'sparsha', password_confirmation: 'sparsha')
      commentUser.save

      notifiedUser = User.create(email: 'sparsha@gmail.com', password: 'sparsha', password_confirmation: 'sparsha')
      notifiedUser.save

      post = Post.new(title: "Hello World", user_id: notifiedUser.id, reposted_from: false)    
      post.save

      comment = Comment.new(title: "Test Notification", user_id: commentUser.id, post_id: post.id )
      expect { comment.save }.to change(notifiedUser.notifications, :count).by(1)
    end
  end
end
