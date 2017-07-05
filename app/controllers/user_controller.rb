class UserController < ApplicationController

    #MARIAH: 
    def login
    end

    def admin_login
        session[:login] = 1
        flash[:notice] = "Admin login sucessfull!"
        redirect_to :controller => :profiles
    end
    
    def logout
        session[:login] = nil
        flash[:notice] = "You have successfully logged out!"
        redirect_to :controller => :profiles
    end
    
end
