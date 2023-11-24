class PostTest < ActiveSupport::TestCase
 context "When a post title is present" do
  it "should save post to the database" do
    user = User.new(email: 'imailsparsha@gmail.com', password: 'password', password_confirmation: 'password' )
    user.save
    post = Post.new(title: "Hello World", user_id: user.id, reposted_from: false)    
    expect { post.save }.to change(Post, :count).by(1)
  end
 end
 context "When a post title is edited" do 
  it "should update the title" do 
    user = User.new(email: 'imailsparsha@gmail.com', password: 'password', password_confirmation: 'password' )
    user.save
    post = Post.new(title: "Hello World", user_id: user.id, reposted_from: false)    
    post.save
    post.title = "Testing"
    post.save
    expect(post.title).to eq("Testing")
  end
 end
 context "When a user is absent while creating a post" do
  it "shouldn't save the post to the database" do 
    post = Post.new(title: 'Hello World', body: 'Test Case', reposted_from: false)
    expect { post.save }.to change(Post, :count).by(0)
  end
 end
 context "When a post is destroyed" do
  it "should destroy post from the database" do 
    user = User.new(email: 'imailsparsha@gmail.com', password: 'password', password_confirmation: 'password') 
    user.save
    post = Post.new(title: 'Hello World', user_id: user.id , reposted_from: false)
    post.destroy
    expect(Post.count).to eq 0
  end
 end
end
