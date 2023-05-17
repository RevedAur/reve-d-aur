# frozen_string_literal: true

module ProfessionalAccountHelper
  def professional?
    return true if Professional.find_by(user: current_user)

    false
  end
end
