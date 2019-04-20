class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by_email(session_params[:email])
		if user && user.password == session_params[:password]
			session[:current_user_id] = user.id
			flash[:notice] = "You are now logged in " + user[:name]
			cookies["log in"] = String(user.id)
			redirect_to "/users/" + String(user.id)
		else

			flash[:notice] = "Invalid password or mail"
			redirect_to root_url
		end
	end

	def destroy
		@_current_user = session[:current_user_id] = nil
		cookies["log in"] = nil
    		flash[:notice] = "Your session has ended."
		redirect_to root_path
	end
	
	private

	def session_params
		params.require(:session).permit(:email, :password)
	end
end
