class ReceipesController < ApplicationController
  skip_before_action :authenticate_user!,only: [:index, :show]
  def index
    if params[:ingred].present?
  	 @receipes = Receipe.select{|rec| rec.ingredients.map(&:ingred).include?(params[:ingred])}
    else
      @receipes = Receipe.all.order('created_at DESC, id DESC')
    end
  end

  def show
    @receipe = Receipe.find(params[:id])
  end

  def new
  	@receipe = Receipe.new
    @receipe.ingredients.new
    @receipe.receipe_photos.new
  end

  def edit
    @receipe = Receipe.find(params[:id])
  end

  def update
	  @receipe = Receipe.find(params[:id])
	 
	  if @receipe.update(receipe_params)
	    redirect_to @receipe
	  else
	    render 'edit'
	  end
  end

  def destroy
    @receipe = Receipe.find(params[:id])
    @receipe.destroy
 
    redirect_to receipes_path
  end


  def create
  	@receipe = Receipe.new(receipe_params)
	  if @receipe.save
	    redirect_to @receipe
	  else
	    render 'new'
	  end
  end


  private
  def receipe_params
    params.require(:receipe).permit(:name, :description, ingredients_attributes: [:receipe_id, :ingred], receipe_photos_attributes: [:id, :receipe_id, :photo])
  end
end
