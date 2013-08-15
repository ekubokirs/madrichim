class TeenController < ApplicationController
 def index
 	@teens = User.where(_type: "Teen").all
 end

 def show
 	@teens = User.where(_type: "Teen").all
 	@teen = User.find(params[:id])
 end 
end