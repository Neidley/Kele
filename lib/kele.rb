require 'httparty'
require './lib/roadmap.rb'

class Kele
  include HTTParty
  include Roadmap

  def initialize(email, password)
    base_url = 'https://www.bloc.io/api/v1'
    @response = Kele.post("#{base_url}/sessions", body: {email: email, password: password})
    @auth_token = @response["auth_token"]
  end

  def get_me
    base_url = 'https://www.bloc.io/api/v1'
    response = self.class.get("#{base_url}/users/me", headers: { "authorization" => @auth_token } )
    JSON.parse(response.body)
  end

  def get_mentor_availability(mentor_id)
    base_url = 'https://www.bloc.io/api/v1'
    response = self.class.get("#{base_url}/mentors/#{mentor_id}/student_availability", headers: { "authorization" => @auth_token } )
    JSON.parse(response.body)
  end

  def get_messages(page = nil)
    base_url = 'https://www.bloc.io/api/v1'
    if page == nil
      response = self.class.get("#{base_url}/message_threads", headers: { "authorization" => @auth_token } )
    else
      response = self.class.get("#{base_url}/message_threads/?page=#{page}", headers: { "authorization" => @auth_token } )
    end
    JSON.parse(response.body)
  end

  def create_message(msg)
    sender = 'neidz44@gmail.com'
    recipientid = 946
    base_url = 'https://www.bloc.io/api/v1'
    response = self.class.post("#{base_url}/messages", body: {sender: sender, recipient_id: recipientid, subject: 'Yo! Sending thing from Kele', 'stripped-text': msg }, headers: { "authorization" => @auth_token } )
    puts 'successfully sent! Message: ' + msg
  end

end
