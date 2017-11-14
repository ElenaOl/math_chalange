class ChildrenController < ApplicationController
    before_action :current_user, :is_authenticated
    puts(:current_user)
    
    def show
       @child = Child.find(params[:id])
    #    @games = Game.where(:child_id => @current_child.id)
       redirect_to games_path
    end
    
    def new
        # user = @user.id
        # puts(user "#####")
        @children = Child.new
        # puts "new route #{child_params}" 
    end
    
    def index
        @children = Child.where(:user_id => @current_user.id)
        # @user.id = 
        # @children = Child.all.where(:user_id => :user_id)
        # @children = Child.new
    end
    
    def create
        Child.create(child_params)
        redirect_to children_path
        # user = :user_id
        # puts(user)
        # # user.children.create(child_params)
        # # user.save
        # flash[:success] = "New child added!"
        # flash[:success] = child_params
        # redirect_to children_path
    end
    
    # def edit
    # end
    
    def delete
        Child.find(params[:id]).delete
        redirect_to children_path
    end
    
    # def destroy
    # end
    private
    def child_params
        # defaults = { user_id: current_user.id }
        # params.require(:child).permit(:name, :user_id => @current_user.id)
        defaults = { user_id: current_user.id }
        params.require(:child).permit(:user_id, :name).reverse_merge(defaults)
    end
      
      
end
