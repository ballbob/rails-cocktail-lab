class CocktailsController < ApplicationController

  def cocktail_params
    params.require(:cocktail).permit([:name,:ingredient])
  end

  def index
    cocktails = Cocktail.all
    render :json => cocktails
  end

  def update
    cocktail = Cocktail.find(params[:id])
    if cocktail.update_attributes(cocktail_params)
      render json: cocktail
    else
      render json: { status: :update_failed}
    end     
  end

  def create
    cocktail = Cocktail.create(cocktail_params)
    render json:  cocktail
  end

  def destroy
    cocktail =Cocktail.find(params[:id])
    if cocktail.destroy!
     render json: {status: :success}
  else
    render json: {status: :delete_failed}
    end
  end

  def show
    cocktail = Cocktail.find(params[:id])
    render json: cocktail 
  end 

end