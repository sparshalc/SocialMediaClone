class PostsControllerTest < ActionDispatch::IntegrationTest
  context "When visited index page" do 
    it "should redirect to root_path" do
      get :index
      expect(response.code).to eq 200
    end
  end
end
