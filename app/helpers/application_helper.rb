module ApplicationHelper

  def get_address(client_id)
    @address =  client_id.street + ', ' + client_id.city + ', ' + client_id.state + " " + client_id.zip.to_s
  end

  def bootstrap_class_for(flash_type)
    case flash_type
      when "success" then "alert-success"
      when "error" then "alert-danger"
      when "alert" then "alert-warning"
      when "notice" then "alert-info"
      else flash_type.to_s
    end
  end

end
