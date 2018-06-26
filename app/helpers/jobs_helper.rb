module JobsHelper

  def get_address(client_id)
    @address =  client_id.street + ', ' + client_id.city + ', ' + client_id.state + " " + client_id.zip.to_s
  end

  def create_client_set(date)
    client_set = Set[]

    @jobs.where('DATE(datetime) = ?', Date.parse(date.to_s)).each do |job|
      client_set.add(job.client_id)
    end

    return client_set.to_a

  end

end
