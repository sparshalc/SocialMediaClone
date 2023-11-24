class BookmarkTest < ActiveSupport::TestCase
  context "When a post is added bookmarked" do
    it "saves the bookmark to the database" do 
      user = User.new(email: 'imailsparsha@gmail.com', password: 'sparsha', password_confirmation: 'sparsha')
      user.save
      post = Post.new(title: 'Hello World', user_id: user.id, reposted_from: false)
      post.save
      bookmark = Bookmark.new(user_id: user.id, post_id: post.id)
      expect { bookmark.save }.to change(Bookmark, :count).by(1)
    end
  end
  context "When a post is removed from bookmark" do
    it "destroys the bookmark from the database" do 
      user = User.new(email: 'imailsparsha@gmail.com', password: 'sparsha', password_confirmation: 'sparsha')
      user.save
      post = Post.new(title: 'Hello World', user_id: user.id, reposted_from: false)
      post.save
      bookmark = Bookmark.create(user_id: user.id, post_id: post.id)
      expect { bookmark.destroy }.to change(Bookmark, :count).to eq(0)
    end
  end
end
