class CommentsController < ApplicationController
  before_action :set_recipe

  def create
    recipe_id = params[:recipe_id]
    @recipe = Recipe.find(recipe_id)
    @comment = @recipe.comments.create(comment_params.merge(user_id: current_user.id, recipe_id: recipe_id))
    redirect_to recipes_path
    # @comment = @recipe.comments.build(comment_params)
    # @comment.user_id = current_user.id
    #
    # if @comment.save
    #   respond_to do |format|
    #     format.html { redirect_to root_path }
    #     format.js
    #   end
    #   # flash[:notice] = "You commented the hell out of that post!"
    #   # redirect_to :back
    # else
    #   flash[:alert] = "Check the comment form, something went  wrong."
    #   render root_path
    # end
  end

  # def destroy
  #   @comment = @recipe.comments.find(params[:id])
  #   if @comment.user_id == current_user.id
  #     @comment.delete
  #     respond_to do |format|
  #       format.html { redirect_to root_path }
  #       format.js
  #     end
  #   end
  #  # flash[:notice] = "Comment deleted :("
  #  # redirect_to root_path
  # end

  private

    def comment_params
      params.require(:comment).permit(:content, :recipe_id, :user_id)
    end

    def set_recipe
      recipe_id = params[:recipe_id]
      @recipe = Recipe.find(params[:recipe_id])
    end
end
