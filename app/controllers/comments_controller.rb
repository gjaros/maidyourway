class CommentsController < ApplicationController
  before_action :set_comment, only: [:edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show]

  authorize_resource
  skip_authorize_resource :only => :new

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  def create
    @comment = Comment.new(comment_params)

    respond_to do |format|
      if @comment.save
        format.html { redirect_to blog_post_path(id: @comment.blog_post_id), notice: 'Comment was successfully created.' }
      else
        format.html { render :edit, notice: 'Comment failed to post.' }
      end
    end
  end

  # PATCH/PUT /comments/1
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to blog_post_path(id: @comment.blog_post_id), notice: 'Comment was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  # DELETE /comments/1
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to blog_post_path(id: @comment.blog_post_id), notice: 'Comment was successfully destroyed.' }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:user_id, :blog_post_id, :comment)
    end
end
