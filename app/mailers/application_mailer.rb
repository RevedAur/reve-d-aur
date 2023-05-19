# frozen_string_literal: true

class ApplicationMailer < ActionMailer::Base
  default from: 'franck.titotto@hotmail.fr'
  layout 'mailer'
end
