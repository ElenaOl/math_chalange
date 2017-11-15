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
        puts "updateupdateupdateupdateupdateupdateupdatevvvvvvvvvvvvvvvv"
        puts @game_id = params[:game_id]
        @num1 = params[:num1].to_i
        @num2 = params[:num2].to_i
        @operation = params[:operation]
        puts "@num1@num1v@num1v@num1@num1v"
        # puts @num1.class
        puts @num1
        puts @num2
        puts @operation.class
        # read user result
        @result = params[:result]
        puts "resultresultvvresultresultresultresult"
        puts @result
        if(@operation == "-")
            @expected_answer = @num1 - @num2
        else
            @expected_answer = @num1 + @num2  
        end      
        puts "expected answer"
        puts @expected_answer 

        if(@result == @expected_answer)
            @correct_answer 
        end    
        # if(@result)
        
        #read gameid and get from db
        # check result
        # show next problem (redirect to create with params and option useSame)
        # redirect_to controller: 'games', action: 'update', result: result, 
    end
    
        
    def create
        puts "aaaaaaaaa"
        puts params[:game]
        puts "game_params"
        puts game_params()



        @game = params[:game]
        @level = @game[:level]
        @operation = @game[:operation]
        @child_id = @game[:child_id]
        @result = @game[:result]

        if(@level == "1") 
            @num1 = rand(0..10) 
            @num2 = rand(0..10) 
        elsif(@level == "2")
            @num1 = rand(10..20)
            @num2 = rand(10..20) 
        else(@level == "3")
            @num1 = rand(20..100)
            @num2 = rand(20..100)     
        end

        if(@num1 < @num2)
            temp = @num1;
            @num1 = @num2;
            @num2 = temp;
        end   

        problem = "#{@num1} #{@operation} #{@num2} = "
        num1 = @num1
        num2 = @num2
        operation = @operation

        # if(@result == "")
            Game.create(game_params)
            redirect_to controller: 'games', action: 'new', problem: problem, num1: num1, num2: num2, operation: operation
        # else
        #     Game.create(game_params)
        #     redirect_to controller: 'games', action: 'update', result: result
        # end
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
        puts "params[:child_id]vvparams[:child_id]params[:child_id]params[:child_id]"
        puts @child_id
        defaults = { child_id: @child_id }
        params.require(:game).permit(:level, :operation, :problem, :expected_answer, :correct_answer, :right_count, :tries_count, :total_count, :start_time, :end_time, :user_id, :child_id).reverse_merge(defaults)
    end
    
end
      






       
    


#    
    
#     # def edit
#     # end
    

    
#     # def delete
#     # end
    
#     # def destroy
#     # end
    
#     
# end
