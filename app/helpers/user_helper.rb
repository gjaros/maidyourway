module UserHelper

  def find_workers(job)
    return job.workers.scan(/\d+/).each { |x| x.to_i }
  end

  private

  def authorize_admin
    return unless !current_user.admin?
    redirect_to root_path, alert: 'Admins only!'
  end

end
