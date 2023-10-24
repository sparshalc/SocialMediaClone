class CommentsController < ApplicationController 
  def create
      @post = Post.find_by(id: params[:post_id])
      @comment = @post.comments.new(comments_params)
      @comment.user_id = current_user.id
      respond_to do |format|
        if @comment.save
          format.turbo_stream { flash.now[:notice] = "Comment was successfully created." }
          format.html { redirect_to post_path(@post), notice: "Comment was successfully created." }
        else
            redirect_to post_path(@post.id),alert: "Comment can't be blank!"
        end
      end
  end

  def destroy
      @post = Post.find_by(id: params[:post_id])
      @comment = @post.comments.find_by(id: params[:id])
      respond_to do |format|
        if @comment.destroy
          format.turbo_stream { flash.now[:notice] = "Comment was successfully destroyed." }
        end
      end 
  end

  private
  def comments_params
      params.require(:comment).permit(:title)
  end
end