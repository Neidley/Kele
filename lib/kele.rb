require 'httparty'

class Kele
  include HTTParty

  def initialize(username, password)
    @base_api_url = 'https://www.bloc.io/api/v1'
    @auth_token = self.class.post('https://www.bloc.io/api/v1/sessions', username, password)
  end

end
