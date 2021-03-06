class GamesController < ApplicationController
    before_action :current_user, :is_authenticated

    def new
        @child = Child.find(params[:child_id])
        @game = Game.new
    end

    def make_problem

        level = @game[:level]
        operation = @game[:operation]

        if(level == 1) 
            num1 = rand(0..10) 
            num2 = rand(0..10) 
        elsif(level == 2)
            num1 = rand(10..20)
            num2 = rand(10..20) 
        else(level == 3)
            num1 = rand(20..100)
            num2 = rand(20..100)     
        end

        if(num1 < num2)
            temp = num1;
            num1 = num2;
            num2 = temp;
        end   

        problem = "#{num1} #{operation} #{num2} = "
        @game[:problem] = problem


        if(operation == "-")
            expected_answer = num1 - num2
        else
            expected_answer = num1 + num2  
        end 
        @game[:expected_answer] = expected_answer

        @game.save
    end


    def create
        @game = params[:game]
        level = @game[:level]
        operation = @game[:operation]
        child_id = @game[:child_id]
        start_time = Time.new
        @game[:start_time] = start_time
        @game = Game.create(game_params)
        
        make_problem
        redirect_to controller: 'games', action: 'show', id:@game[:id]
    end

    
    def show
        @game = Game.find(params[:id])
    end

    def update
        game_id = params[:id]
        @game = Game.find(game_id)
        # read user result
        result = params[:result].to_i
             
        expected_answer = @game[:expected_answer]

        if(result == expected_answer)
            @game[:right_count] += 1
        end 
        @game[:total_count] += 1
        if(@game[:total_count] == 20)
            @game[:end_time] = Time.now
        end    
        
        make_problem
        redirect_to controller: 'games', action: 'show', id:@game[:id]

    end
    
        

    
    private
    def game_params
        defaults = { child_id: @child_id, right_count: 0, total_count: 0}
        params.require(:game).permit(:level, :operation, :problem, :expected_answer, :right_count, :total_count, :start_time, :end_time, :child_id).reverse_merge(defaults)
    end
    
end
      






       
    



