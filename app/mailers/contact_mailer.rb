class ContactMailer < ApplicationMailer
  def contact_email(params)
    @email = params[:email]
    @content = params[:content]
    mail(to: 'franck1@yopmail.com', subject: 'Welcome to My Awesome Site')
  end
end
