class RecipesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_recipe, only: [:show, :edit, :update, :destroy]
  def new
    @recipe = Recipe.new
  end

  def index
    @recipes = Recipe.all.order('created_at DESC')
  end

  # def show
  #   @recipe = Recipe.find(params[:id])
  # end

  def create
    @recipe = Recipe.new(post_params.merge(user_id: current_user.id))
    if @recipe.save
      flash[:notice] = "Your post has been created!"
      redirect_to recipes_path
    else
      flash[:alert] = "Upload failed"
      render :new
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if current_user == @recipe.user
      if @recipe.update(post_params)
        flash[:notice] = "Recipe updated."
        redirect_to recipes_path
      else
        flash[:alert] = "Update failed.  Please check the form."
        render :edit
      end
    else
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to root_path
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    if current_user == @recipe.user
      @recipe.destroy
      flash[:notice] = "Recipe deleted."
      redirect_to recipes_path
    else
      flash[:alert] = "That post doesn't belong to you!"
      redirect_to root_path
    end
  end

  private
    def post_params
      params.require(:recipe).permit(:image, :description, :user_id)
    end

    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # def my_recipe
    #   if current_user == @recipe.user
    #     @recipe.destroy
    #     flash[:notice] = "Recipe deleted."
    #     redirect_to recipes_path
    #   else
    #     flash[:alert] = "That post doesn't belong to you!"
    #     redirect_to root_path
    #   end
    # end
end
