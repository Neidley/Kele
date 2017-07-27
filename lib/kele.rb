require 'httparty'

class Kele
  include HTTParty

  def initialize(email, password)
    base_url = 'https://www.bloc.io/api/v1'
    @response = Kele.post("#{base_url}/sessions", body: {email: email, password: password})
  end

  def get_me
    base_url = 'https://www.bloc.io/api/v1'
    response = self.class.get("#{base_url}/sessions", headers: { "authorization" => @auth_token } )
    JSON.parse(response)
  end

end
