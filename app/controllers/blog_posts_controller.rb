class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: %i[show edit update destroy]
  before_action :authenticate_user!, only: %i[create edit update destroy]

  def index
    @blog_posts = BlogPost.all
  end

  def show
  end

  def new
    @blog_post = BlogPost.new
  end

  def create
    @blog_post = BlogPost.new(blog_post_params)
    if @blog_post.save
      redirect_to @blog_post, notice: 'Blog Post was successfully created.'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @blog_post.update(blog_post_params)
      redirect_to @blog_post, notice: 'Blog Post was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @blog_post.destroy
    redirect_to blog_posts_url, notice: 'Blog Post was successfully destroyed.'
  end

  private

  def set_blog_post
    @blog_post = BlogPost.find(params[:id])
  end

  def blog_post_params
    params.require(:blog_post).permit(:title, :body, :description, :image, :featured)
  end
end
