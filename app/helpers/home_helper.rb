
module HomeHelper
require 'gdata'
require 'nokogiri'
def fetch_contacts(token)
  client = GData::Client::Contacts.new
  client.authsub_token = token
  @contacts = Array.new

  # por las dudas para forzar en caso de que estos tokens, expiren
  #client.auth_handler.upgrade()
 
  req = client.get 'https://www.google.com/m8/feeds/contacts/default/full/?max-results=2'

  doc = Nokogiri::HTML(req.body)
  entries = doc.search('//entry')
  entries.map do |entry|
     
    @name = entry.at('./title').content 
    @email = entry.at('./email')['address']
    @contacts << [@name, @email]
  end
    @contacts

  #entries.reject!{|entry| entry[:name].to_s.empty?}
end
 


end
