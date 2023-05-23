require "rails_helper"

RSpec.describe ::Account::CartsController, type: :request do
  let!(:user) { create(:user) }
  let!(:cart) { create(:cart, user: user) }
  let!(:article) { create(:article) }

  context 'Not logged in' do
    describe 'GET /index' do
      it 'redirect to login page' do
        get account_cart_path
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end

  context 'Logged in' do
    before { sign_in user }

    describe 'GET /index' do
      it 'returns http success' do
        get account_cart_path
        expect(response).to have_http_status(200)
      end
    end

    describe 'GET /show' do
      it 'returns http success' do
        get account_cart_path(cart)
        expect(response).to have_http_status(200)
      end
    end

    describe 'PATCH /update' do
      let(:params) { { article_id: article.id } }

      it 'add article to Cart and redirect' do
        expect(CartArticle.count).to eq 0

        patch account_cart_path(cart), params: params

        expect(response).to redirect_to(root_path)
        expect(CartArticle.count).to eq 1
      end
    end
  end
end
