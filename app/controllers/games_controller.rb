class GamesController < ApplicationController
  
    def index
        @child = Child.find(params[:child_id])
        @games = Game.all
        @games = Game.where(:child_id => @child.id)
        @games = Game.new
    end
        
    def create
        if @current_user
            @c = Comment.new(comment_params)
            @c.save!
            redirect_to "/comments/" + comment_params[:post_id]
        else
            flash[:warning] = "You need to log in to post a comment"
            redirect_to login_path
        end
    end
    
    private
    
    def comment_params
        params.require(:comment).permit(:level, :operation, :user_id, :child_id)
    end
    
end
           
       
    
    # def show
    #    @game = Game.find(params[:id])
    # end
    
#     def new
#         @game = Game.new
#         # puts "new route #{child_params}" 
#     end
    
#     def index
#         @games = Game.all
#     end
    
#     def create
#         Game.create(child_params)
#         redirect_to games_path
#     end
    
#     # def edit
#     # end
    
#     # def update
#     # end
    
#     # def delete
#     # end
    
#     # def destroy
#     # end
    
#     def child_params
#         defaults = { child_id: current_child.id }
#         params.require(:child).permit(:child_id, :level, :operation).reverse_merge(defaults)
#     end
# end
