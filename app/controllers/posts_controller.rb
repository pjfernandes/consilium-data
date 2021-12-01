class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: %i[index show]

  def index
    if params[:query].present?
      @posts = Post.search_by_title_and_content(params[:query]).sort.reverse
    else
      @posts = Post.all.sort.reverse
    end

    # respond_to do |format|
    #   format.html # Follow regular flow of Rails
    #   format.text { render partial: 'posts/list', locals: { posts: @posts }, formats: [:html] }
    # end
  end

  def show
    @post = Post.find(params[:id])
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
        send_confirmation
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
      redirect_to post_path(@post)
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

  def send_confirmation
    UserMailer.with(user: self).confirmation.deliver_now!
  end

end
