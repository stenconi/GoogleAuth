
class HomeController < ApplicationController
 helper HomeHelper

 def index #dashboard
  # los datos provistos por google ya estan en db disponibles en current_user
    #@contacts = fetch_contacts(current_user.oauth_token)

  # sucede el render
end

end


