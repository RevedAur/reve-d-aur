# frozen_string_literal: true

module ProfessionalAccountHelper
  def is_professional
    return true if Professional.find_by(user: current_user)

    false
  end
end
