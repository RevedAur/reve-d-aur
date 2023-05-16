module ProfessionalAccountHelper
  def is_professional
    return true if Professional.find_by(user: current_user)

    false
  end
end
