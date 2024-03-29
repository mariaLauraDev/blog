class BlogPostsController < ApplicationController
  before_action :set_blog_post, except: [:index, :new, :create] #only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @blog_posts = user_signed_in? ? BlogPost.recent : BlogPost.published.recent
  end

  def show
  rescue ActiveRecord::RecordNotFound
    # render file: "#{Rails.root}/public/404.html", layout: false, status: :not_found
    redirect_to root_path
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)

    if @blog_post.save
      redirect_to @blog_post
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @blog_post.destroy

    redirect_to root_path
  end

  private

  def blog_post_params
    params.require(:blog_post).permit(:title, :content, :published_at)
  end

  def set_blog_post
    @blog_post = user_signed_in? ? BlogPost.find(params[:id]) : BlogPost.published.find(params[:id])
  end
end
