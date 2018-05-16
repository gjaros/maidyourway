class BlogPostsController < ApplicationController
  before_action :set_blog_post, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  authorize_resource
  skip_authorize_resource :only => [:index, :show]

  # GET /blog_posts
  def index
    @blog_posts = BlogPost.all
  end

  # GET /blog_posts/1
  def show
    @comment = Comment.new
  end

  # GET /blog_posts/new
  def new
    @blog_post = BlogPost.new
  end

  # GET /blog_posts/1/edit
  def edit
  end

  # POST /blog_posts
  def create
    @blog_post = BlogPost.new(blog_post_params)

    respond_to do |format|
      if @blog_post.save
        format.html { redirect_to blog_posts_path(@blog_post), notice: 'Blog post was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  # PATCH/PUT /blog_posts/1
  def update
    respond_to do |format|
      if @blog_post.update(blog_post_params)
        format.html { redirect_to blog_posts_path(@blog_post), notice: 'Blog post was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /blog_posts/1
  def destroy
    @blog_post.destroy
    respond_to do |format|
      format.html { redirect_to blog_posts_url, notice: 'Blog post was successfully destroyed.' }
    end
  end

  private
    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    def blog_post_params
      params.require(:blog_post).permit(:user_id, :title, :blog, :blog_pic)
    end
end
