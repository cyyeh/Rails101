class PostsController < ApplicationController
  before_action :authenticate_user!, :only => [:new, :create]
  before_action :find_post_and_check_permission, :only => [:edit, :update, :destroy]

  def new
    @group = Group.find(params[:group_id])
    @post = Post.new
  end

  def create
    @group = Group.find(params[:group_id])
    @post = Post.new(post_params)
    @post.group = @group
    @post.user = current_user
    if @post.save
      redirect_to group_path(@group)
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @post.update(post_params)
      redirect_to group_path(@group), notice: "Update Success"
    else
      render :edit
    end    
  end

  def destroy
    @post.destroy
    redirect_to group_path(@group), alert: "Post deleted"
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end

  def find_post_and_check_permission
    @group = Group.find(params[:group_id])
    @post = Post.find(params[:id])
    if current_user != @post.user
      redirect_to group_path(@group), alert: "You have no permission"
    end
  end
end
