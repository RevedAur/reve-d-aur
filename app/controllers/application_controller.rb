# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_paramters, if: :devise_controller?
  before_action :set_navbar

  protected

  def configure_permitted_paramters
    devise_parameter_sanitizer.permit(:sign_up, keys: %i[first_name last_name phone_number birth_date])
  end

  private

  def set_navbar
    @clothes = ClothingModel.find_by(name: 'clothing')&.categories
    @accessory = ClothingModel.find_by(name: 'accessory')&.categories
  end
end
