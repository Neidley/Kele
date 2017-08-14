require 'httparty'

class Kele
  include HTTParty

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

end
