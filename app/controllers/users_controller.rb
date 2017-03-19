class UsersController < ApplicationController
   def my_portfolio
       @stocks = current_user.stocks if current_user.stocks.any?
       @user = current_user
   end
   
   def my_friends
      @friendships = current_user.friends
   end
   
   def search
      @users = User.search(params[:search_param])
      if @users
         @users = current_user.except_current_user(@users)
         render partial: "friends/lookup"
      else
         render status: :not_gound, nothing: true
      end
   end
   
   def add_friend
      @friend = User.find(params[:friend])
      current_user.friendships.build(friend_id: @friend.id)
      
      if current_user.save
         redirect_to my_friends_path, flash[:notice] = "User added as friend"
      else
         redirect_to my_friends_path, flash[:error] = "There was an error. Please try again."
      end
   end
end