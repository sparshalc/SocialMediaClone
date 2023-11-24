class UserTest < ActiveSupport::TestCase
  context "When a new user sign's up" do
    it "should save the user to the database" do
      user = User.new(email: 'imailsparsha@gmail.com', password: 'password', password_confirmation: 'password')
      expect { user.save }.to change(User, :count).by(1)
    end
  end
  context "When a user tries to login with same email that has already been saved to the database" do
    it "doesn't saves the data to the database" do
      user = User.new(email: 'imailsparsha@gmail.com', password: 'password', password_confirmation: 'password')
      user.save
      new_user = User.new(email: 'imailsparsha@gmail.com', password: 'newaccount', password_confirmation: 'newaccount')
      expect(User.count).to eq(1)
    end
  end
  context "When the password and password confirmation doesn't matches" do
    it "doesn't saves the user to the database" do
      user = User.new(email: 'imailsparsha@gmail.com', password: 'sparsha', password_confirmation: 'notsparsha')
      expect { user.save }.to change(User, :count).by(0)
    end
  end
  context "When the email doesn't matches email's pattern" do
    it "doesn't saves the user to  the database" do
      user = User.new(email: 'imailsparsha', password: 'password', password_confirmation: 'password')
      expect { user.save }.to change(User, :count).by(0)
    end
  end
end

