class HomeController < ApplicationController
  def contacts_callback
   @contacts = request.env['omnicontacts.contacts']
   render "index"
  end
end