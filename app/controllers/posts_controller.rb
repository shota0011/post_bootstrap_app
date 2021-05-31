class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    post = Post.create!(post_params)
    redirect_to post
  end

  private

  def post_params
    params.require(:post).premit(:title, :content)
  end
end
