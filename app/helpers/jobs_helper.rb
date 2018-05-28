module JobsHelper

  def get_address(client_id)
    @address =  client_id.street + ', ' + client_id.city + ', ' + client_id.state + " " + client_id.zip.to_s
  end

end
