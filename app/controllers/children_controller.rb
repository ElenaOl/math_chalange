class ChildrenController < ApplicationController
    before_action :current_user, :is_authenticated
    
    # def show
    #    @child = Child.find(params[:id])
    # end
    
    def new
        @child = Child.new
        # puts "new route #{child_params}" 
    end
    
    def index
        @children = Child.all
    end
    
    def create
        # Child.create(child_params)
        # redirect_to children_path
        user = @current_user
        user.children.create(child_params)
        user.save
        flash[:success] = "New child added!"
        flash[:success] = child_params
        redirect_to children_path
    end
    
    # def edit
    # end
    
    # def delete
    # end
    
    # def destroy
    # end
    private
    def child_params
        defaults = { user_id: current_user.id }
        params.require(:child).permit(:user_id, :name).reverse_merge(defaults)
    end
      
      
end
