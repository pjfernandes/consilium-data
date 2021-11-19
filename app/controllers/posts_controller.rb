class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

   def index
    #if params[:query_ship]
     # @posts = Occurrence.search_by_ship(params[:query_ship])
    #else
      @posts = Post.all
    #end
  end

  def show
    @post = Post.find(params[:id])
    #@bookmark = Bookmark.new
  end

  def new
    if current_user.admin?
      @post = Post.new
    else
      redirect_to root_path
    end
  end

  def create
    if current_user.admin?
      @post = Post.new(post_params)
      @post.user = current_user
      if @post.save
        redirect_to post_path(@post), notice: 'Post was successfully created!'
      else
        render :new
      end
    end
  end

  def edit
    if current_user.admin?
      @post = Post.find(params[:id])
    else
      redirect_to post_path
    end
  end

  def update
    if current_user.admin?
      @post = Post.find(params[:id])
      @post.user = current_user
      @post.update(post_params)
      redirect_to post_path(@post)
    end
  end

  def destroy
    if current_user.admin?
      @post = Post.find(params[:id])
      @post.destroy
      redirect_to posts_path
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :legend, :user_id, :photo)
  end

end
