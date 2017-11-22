class ChildrenController < ApplicationController
    before_action :current_user, :is_authenticated
    puts(:current_user)
    
    def show
       @child = Child.find(params[:id])
       redirect_to games_path(:child_id => params[:id])
    end
    
    def new
        @children = Child.new
    end
    
    def index
        @children = Child.where(:user_id => @current_user.id)
    end
    
    def create
        Child.create(child_params)
        redirect_to children_path
    end
    
    
    def delete
        Child.find(params[:id]).delete
        redirect_to children_path
    end
    
    private
    def child_params
        defaults = { user_id: current_user.id }
        params.require(:child).permit(:user_id, :name).reverse_merge(defaults)
    end
      
      
end
