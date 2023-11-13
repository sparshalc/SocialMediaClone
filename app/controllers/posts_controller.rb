class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :correct_user, only: %i[edit update destroy]

  def index
    @q = Post.ransack(params[:q])
    @posts = @q.result(distinct: true).order('Created_at DESC')

    if current_user
      @notifications = current_user.notifications.limit(3)
      current_user.notifications.mark_as_read!
    end
  end

  def show
    @comment = @post.comments.order("Created_at DESC")
    @post.update(views: @post.views + 1)
  end

  def new
    @post = Post.new
  end

  def edit
  end

  def create
    @post = Post.new(post_params)

    respond_to do |format|
      if @post.save
        format.turbo_stream { flash.now[:notice] = "Post was successfully created." }
      else
        format.turbo_stream { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.turbo_stream { flash.now[:notice] = "Post was successfully updated!" }
      else
        format.turbo_stream { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post.destroy

    respond_to do |format|
      format.turbo_stream { flash.now[:notice] = "Post was successfully destroyed." }
    end
  end

  private

  def correct_user
    @post = current_user.posts.find_by(id: params[:id])
    redirect_to root_path,alert: "Not Authorized!" if @post.nil?
  end

    def set_post
      @post = Post.find(params[:id])
    end

    def post_params
      params.require(:post).permit(:title, :body, :user_id, images: [])
    end
end
