
class HomeController < ApplicationController
 include HomeHelper

 def index 
 	redirect_to "/sessions/create" unless current_user
 	@contacts = fetch_contacts(current_user.oauth_token)    
 end
end


