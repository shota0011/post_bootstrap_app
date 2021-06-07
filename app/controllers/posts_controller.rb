class PostsController < ApplicationController
  before_action :set_post, only: %i[show destroy edit update]

  def new
    @post = Post.new
  end

  def create
    post = Post.create!(post_params)
    redirect_to post, notice: "投稿しました"
  end

  def show
  end

  def index
    @posts = Post.order(id: :asc)
  end

  def destroy
    @post.destroy!
    redirect_to root_path, notice: "削除しました"
  end

  def edit
  end

  def update
    @post.update!(post_params)
    redirect_to @post, notice: "更新しました"
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
