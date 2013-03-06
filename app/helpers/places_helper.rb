module PlacesHelper
  def state_btn_class_for(place)
    if place.state_appointment?
      'btn-warning'
    elsif place.state_phoned?
      'btn-inverse'
    elsif place.state_not_interested? or place.state_rejected?
      'btn-danger'
    elsif place.state_met?
      'btn-info'
    elsif place.state_to_connect?
      'btn-primary'
    elsif place.state_success?
      'btn-success'
    end
  end

  def row_class_for(place)
    if place.state_appointment?
      'warning'
    elsif place.state_phoned?
      'warning'
    elsif place.state_not_interested? or place.state_rejected?
      'error'
    elsif place.state_met?
      'info'
    elsif place.state_to_connect?
      'info'
    elsif place.state_success?
      'success'
    end
  end

  def label_class_for(place)
    if place.state_appointment? or place.state_phoned?
      'label-warning'
    elsif place.state_not_interested? or place.state_rejected?
      'label-important'
    elsif place.state_met?
      'label-info'
    elsif place.state_to_connect?
      'label-info'
    elsif place.state_success?
      'label-success'
    end
  end
end