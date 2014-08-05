OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '779750099775-h9u08ae2160leqpo68nenbjg7rbrpl2a.apps.googleusercontent.com', 'Th0kARTIlYoUk4lOJexAnV-s', {
     prompt: 'select_account',
     access_type: 'offline',
     approval_prompt: 'force',
     scope: "http://www.google.com/m8/feeds/,userinfo.email,userinfo.profile,plus.login,plus.me" 
   }



  
end