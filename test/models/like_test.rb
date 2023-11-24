class LikeTest < ActiveSupport::TestCase
  context "When a post is liked" do
    it "saves the like to the database" do 
      user = User.new(email: 'imailsparsha@gmail.com', password: 'sparsha', password_confirmation: 'sparsha')
      user.save
      post = Post.new(title: 'Hello World', user_id: user.id, reposted_from: false)
      post.save
      like = Like.new(user_id: user.id, post_id: post.id)
      expect { like.save }.to change(Like, :count).by(1)
    end
  end
  context "When a post is disliked" do
    it "destroys the like from the database" do 
      user = User.new(email: 'imailsparsha@gmail.com', password: 'sparsha', password_confirmation: 'sparsha')
      user.save
      post = Post.new(title: 'Hello World', user_id: user.id, reposted_from: false)
      post.save
      like = Like.create(user_id: user.id, post_id: post.id)
      expect { like.destroy }.to change(Like, :count).to eq(0)
    end
  end
end
