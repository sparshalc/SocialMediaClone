class CommentTest < ActiveSupport::TestCase
  context "When a new comment is created" do
    it "saves the comment to the database" do
      user = User.new(email: 'imailsparsha@gmail.com', password: 'password', password_confirmation: 'password')
      user.save
      post = Post.new(title: 'Hello World', user_id: user.id, reposted_from: false)
      post.save
      comment = Comment.new(user_id: user.id, post_id: post.id, title: 'Comment on Hello World')
      expect { comment.save }.to change(Comment, :count).by(1)
    end
  end
  context "When a comment without title is created" do
    it "doesn't saves the comment to the database" do
      user = User.new(email: 'imailsparsha@gmail.com', password: 'password', password_confirmation: 'password') 
      user.save
      post = Post.new(title: 'Hello World', user_id: user.id, reposted_from: false)
      post.save
      comment = Comment.new(user_id: user.id, post_id: post.id)
      expect { comment.save }.to change(Comment, :count).by(0)
    end
  end
  context "When a comment is destroyed" do
    it "gets destroyed from the database" do 
      user = User.new(email: 'imailsparsha@gmail.com', password: 'password', password_confirmation: 'password')
      user.save
      post = Post.new(title: 'Hello World', user_id: user.id, reposted_from: false)
      post.save
      comment = Comment.new(user_id: user.id, post_id: post.id, title: 'Comment on Hello World')
      expect { comment.save }.to change(Comment, :count).by(1)
      comment.destroy
      expect(Comment.count).to eq(0)
    end
  end
end
