# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ContactMailer, type: :mailer do
  let!(:contact_params) { { email: 'test@test.com', content: 'message du form' } }

  describe '#confirmation_email' do
    it 'enqueues a job' do
      expect { ContactMailer.contact_email(contact_params).deliver_later! }
        .to change(enqueued_jobs, :size).by(1)
    end
  end
end
