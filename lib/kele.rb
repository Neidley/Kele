require 'httparty'

class Kele
  include HTTParty

  def initialize(email, password)
    base_url = 'https://www.bloc.io/api/v1'
    @response = Kele.post("#{base_url}/sessions", body: {email: email, password: password})
  end

end
