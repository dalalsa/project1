class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]

  def create
    @animal = Animal.find(params[:animal_id])
    # we use new to make some changes (which is user id will changes each time when user comment) before create the comment
    @comment = @animal.comments.new(comment_params)
    @comment.user_id = current_user.id
    @comment.save
    redirect_to animal_path(@animal)
  end

  def destroy
    @comment = Comment.find_by(id: params[:id])
    @comment.destroy
    redirect_to animal_path(@comment.animal)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :animal_id, :user_id)
  end
end
