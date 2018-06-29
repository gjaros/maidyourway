module JobsHelper

  def create_client_set(date)
    client_set = Set[]

    @jobs.where('DATE(datetime) = ?', Date.parse(date.to_s)).each do |job|
      client_set.add(job.client_id)
    end

    return client_set.to_a

  end

end
