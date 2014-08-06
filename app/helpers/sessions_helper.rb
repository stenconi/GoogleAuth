module SessionsHelper
require 'gdata'
require 'nokogiri'
def fetch_contacts(token)
  client = GData::Client::Contacts.new
  client.authsub_token = token
 
  # por las dudas para forzar en caso de que estos tokens, expiren
  #client.auth_handler.upgrade()
 
  req = client.get 'https://www.google.com/m8/feeds/contacts/default/full/?max-results=1000'
  # req.body tiene el xml con toda la data de contactos

  doc = Nokogiri::HTML(req.body)
  entries = doc.search('//entry')
  entries.map do |entry|
    name = ""
    entry.at('title') do |e|
      name = e.content  
    end
    #img = entry.at('link[type="image/*"]')['href']
    email = entry.at('gd:email[primary="true"]')['address']
    name = email if name.to_s.nil?

    {name: name, email: email}
  end
 
  entries.reject!{|entry| entry[:email].to_s.empty?}
 end
end
