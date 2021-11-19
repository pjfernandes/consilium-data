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
    @post = List.find(params[:id])
    #@bookmark = Bookmark.new
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.save
    #redirect_to lists_path
  end

  private
  def post_params
    params.require(:post).permit(:title, :content)
  end

end
