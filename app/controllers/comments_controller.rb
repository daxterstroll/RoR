class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @comments = @post.comments.create(comment_params)
    redirect_to posts_path(@post)
  end

  private def comment_params
    params.require(:comment).permit(:username, :body)
  end
end
