class PostsController < ApplicationController
  before_action :set_post, only: %i[show destroy edit update]

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to post, notice: "投稿しました"
    else
      flash[:notice] = "投稿に失敗しました"
      render :new
    end

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
    if @post.save
      redirect_to @post, notice: "更新しました"
    else
      flash[:notice] = "更新に失敗しました"
      render :edit
    end

  end

  private

  def set_post
    @post = Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :content)
  end

end
