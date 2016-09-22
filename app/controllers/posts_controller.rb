# Top-level class documentation comment was missing - William Dunlop
# This is really really bad practice
# should always be present
# but in this case it isn't
class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  before_filter :require_permission, only: [:edit, :update, :destroy]

  def require_permission
    if current_user != Post.find(params[:id]).user
      redirect_to root_path
      # Or do something else here
    end
  end
  # This space had uneceassry blank lines
  # Very unresourceful use of space
  # GET /posts
  # GET /posts.json

  def index
    @posts = Post.all
  end

  def toggleVote
    # Not using snake_case on the function name.
    # Honestly, this isnt a class
    post = Post.find(params[:id])
    case current_user.voted_as_when_voted_for(post)
      # Indentation of when should be in line with case. Unbelievable
    when true
      post.downvote_by current_user
    when false
      post.upvote_by current_user
    when nil
      post.upvote_by current_user
    else # The most reduntant else-clause ever
    end
    redirect_to root_path
  end

  def upvote(post)
    post = Post.find(params[:id])
    post.upvote_by current_user
    redirect_to root_path
  end

  def downvote(post)
    post = Post.find(params[:id])
    post.downvote_by current_user
    redirect_to posts_path
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  # function branch condition size is way to high
  # Not to mention the amount of lines it has
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id if current_user
    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  # There should be a blank line before and after private.
  # This was not the case but i fixed it
  # Use callbacks to share common setup or constraints between actions.
  def set_post
    # Indentation was all wrong.
    # Probably the worst I have ever seen
    @post = Post.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  # The above comment is too long
  def post_params
    params.require(:post).permit(:description, :user_id, :image)
  end
end

# Could not believe how bad this controller was
# I fixed it to the best of my ability
# It is too far gone for the most part
# Should probably just start from scratch
# That or give up
# Edited by William Dunlop
