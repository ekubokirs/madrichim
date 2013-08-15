class TeenController < ApplicationController
 def index
 	@teens = User.where(_type: "Teen").all
 end

 def show
 	@teens = User.where(_type: "Teen").all
 	@teen = @teens.find(params[:_id])
 end 
end