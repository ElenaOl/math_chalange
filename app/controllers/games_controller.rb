class GamesController < ApplicationController
    before_action :current_user, :is_authenticated

    def index

        puts "bbbbbbbb"
        #puts :params
        puts params[:child_id]


        @child = Child.find(params[:child_id])

        puts '!!!!!!!childchildchild'
        puts @child

        @games = Game.where(:child_id => :child_id)
        flash[:warning] = @current_user.id
        # @games = Game.where(:child_id => @child.id)
        # @games = Game.new
    end

    # def show
    #     puts "shosshowshow"
    #     puts params
    #     #@game = Game.find(params[:id])
    #  end

    
    def new
        puts '!!!!!newnewnewnew'
        @level = params[:level]
        @operation = params[:operation]
        @child_id = params[:child_id]

        @game = Game.new
        puts '@@@@@@@@@@@aaaaaa'
        puts @game
        puts @game[:id]
         # puts "new route #{child_params}" 
    end

    def update

        # read user result
        #read gameid and get from db
        # check result
        # show next problem (redirect to create with params and option useSame)
    end
    
        
    def create
        puts "aaaaaaaaa"
        puts params[:game]

        @game = params[:game]
        @level = @game[:level]
        @operation = @game[:operation]
        @child_id = @game[:child_id]

        if(@level == 1) 
            @num1 = rand(0..10) 
            @num2 = rand(0..10) 
        elsif(@level == 2)
            @num1 = rand(10..20)
            @num2 = rand(10..20) 
        else(@level == 3)
            @num1 = rand(20..100)
            @num2 = rand(20..100)     
        end

        if(@num1 >= @num2)
            problem = "#{@num1} #{@operation} #{@num2} = "
        else
            problem = "#{@num2} #{@operation} #{@num1} = " 
        end       
        Game.create(game_params)
        redirect_to controller: 'games', action: 'new', problem: problem, game_id: 1234
        
        # '/games/new'(:game => ":game")
        # if @current_user
        #     @c = Game.new(game_params)
        #     @c.save!
        #     redirect_to "/games/" + game_params[:child_id]
        # else
        #     flash[:warning] = "You need to log in"
        #     redirect_to login_path
        # end
    end

    # def show 
    
    # end    

    
    private
    
    def game_params
        #puts :game
        defaults = { child_id: child_id }
        params.require(:game).permit(:level, :operation, :problem, :expected_answer, :correct_answer, :right_count, :tries_count, :total_count, :start_time, :end_time, :user_id, :child_id).reverse_merge(defaults)
    end
    
end
      






       
    
# defaults = { user_id: current_user.id }
#         params.require(:child).permit(:user_id, :name).reverse_merge(defaults)
    

#     def create
#         Game.create(child_params)
#         redirect_to games_path
#     end
    
#     # def edit
#     # end
    

    
#     # def delete
#     # end
    
#     # def destroy
#     # end
    
#     
# end
