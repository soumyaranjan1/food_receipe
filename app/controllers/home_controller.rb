class HomeController < ApplicationController
  skip_before_action :authenticate_user!, :only => [:index]

  def index
  	@ingredients = Ingredient.order('created_at DESC, id DESC')
  end
end
