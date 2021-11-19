class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show new create]

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
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post), notice: 'Post was successfully created!'
    else
      render :new
    end
  end

  private
  def post_params
    params.require(:post).permit(:title, :content, :legend, :user_id, :photo)
  end

end
