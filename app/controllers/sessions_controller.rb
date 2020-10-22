class SessionsController < ApplicationController
    def create
        auth = request.env["omniauth.auth"] #returns response from call back
        session[:omniauth] = auth.except('extra')m#creates a session variable and assign it to the auth call back and add an except extra method
        user = User.sign_in_from_omniauth(auth) #assign a session user_id to a user_id variable
        session[:user_id]= user.user_id
        redirect_to_root_url, notice:" Signed In"

    end
    #the destroy method basically deletes the session variables
    def destroy
        session[user_id] = nil
        session[omniauth] = nil redirect_to_root_url,notice:"Signed Out"
    end
end
