require "rails_helper"

RSpec.describe ContactController, type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get contact_index_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST /create' do
    context 'when valid params' do
      let(:contact_form_params) do
        {
          email: 'wilfried@dea.com',
          content: 'Spec contact form with 25 characters minimum'
        }
      end
      let(:contact_form_post) { post contact_index_path, params: contact_form_params }

      it 'returns success status' do
        contact_form_post

        expect(response).to have_http_status(302)
      end

      it 'enqueues welcome email & confirmation email' do
        expect { contact_form_post }.to change(enqueued_jobs, :size).by(1)
      end
    end

    context 'when invalid params' do
      let(:contact_form_params) do
        {
          email: 'invalid email@fym',
          content: 'Spec contact form'
        }
      end
      let(:contact_form_post) { post contact_index_path, params: contact_form_params }

      it 'returns unprocessable_entity status' do
        contact_form_post

        expect(response).to have_http_status(422)
      end
    end
  end
end
