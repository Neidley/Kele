module Roadmap

  def get_roadmap(roadmap_id)
    base_url = 'http://www.bloc.io/api/v1'
    response = self.class.get("#{base_url}/roadmaps/#{roadmap_id}", headers: { "authorization" => @auth_token } )
    JSON.parse(response.body)
  end

  def get_checkpoint(checkpoint_id)
    base_url = 'http://www.bloc.io/api/v1'
    response = self.class.get("#{base_url}/checkpoints/#{checkpoint_id}", headers: { "authorization" => @auth_token } )
    JSON.parse(response.body)
  end

end
