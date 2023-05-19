# frozen_string_literal: true

class ContactController < ApplicationController
  rescue_from ArgumentError, with: :custom_error

  def index; end

  def create
    validate_email
    validate_message

    ContactMailer.contact_email(contact_params).deliver_later!
    flash[:notice] = t('contact.form.success')
    redirect_to root_path
  end

  private

  def contact_params
    params.permit(:email, :content)
  end

  def custom_error(error)
    flash.now[:alert] = t('shared.flash-error', error: error.message)
    render :index, status: :unprocessable_entity
  end

  def validate_email
    raise ArgumentError, t('contact.form.invalid_email') unless contact_params[:email].match?(/^\S+@\S+\.\S+$/)
  end

  def validate_message
    raise ArgumentError, t('contact.form.too-short_message') if contact_params[:content].length < 25
  end
end
