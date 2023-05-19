# frozen_string_literal: true

class ContactMailerPreview < ActionMailer::Preview

  def contact_email
    ContactMailer.contact_email(contact_params)
  end

  private

  def contact_params
    { email: 'test@test.com', content: 'message du form' }
  end
end
