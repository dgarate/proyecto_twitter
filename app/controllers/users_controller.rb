class UsersController < ApplicationController
    # def profile
    #     @userid = params[:user_id]
    #     @userinfo = User.find(params[:user_id])
    #     @usercount = @userinfo.tweets
    #     @tweets=Tweet.all
    # end


    def index
        @users = User.all
      end
    
      # GET /tweets/1
      # GET /tweets/1.json
      def show
      end

    
      





      
end
