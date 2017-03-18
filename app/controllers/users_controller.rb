class UsersController < ApplicationController
   def my_portfolio
       @stocks = current_user.stocks if current_user.stocks.any?
       @user = current_user
   end
end