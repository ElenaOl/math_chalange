class UserController < ApplicationController
    
      def create
        user = User.create(user_params)
        redirect_to login_path
      end
    
      def edit
        @user = @current_user
      end

      def update
        u = User.find(@current_user.id)
        u.update(user_params)
        redirect_to "/users/show"
      end
    
      def update
        u = User.find(params[:id])
        u.update(user_params)
        redirect_to root_path
      end
    
      def new
        @user = User.new
      end
    
      def destroy
        puts "user_controller to destroy account"
        u = User.find(params[:id])
        u.destroy
        redirect_to new_user_path
      end
    
      def show
        @user = @current_user
        @children = Child.where(:user_id => @current_user.id)
      end
    

      private
      
        def user_params
          params.require(:user).permit(:email, :password)
        end
end
