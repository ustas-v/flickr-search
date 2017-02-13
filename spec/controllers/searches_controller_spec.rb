require 'rails_helper'

RSpec.describe SearchesController, type: :controller do
  describe '#index' do
    before { get :index }

    it 'returns the success code' do
      expect(response).to be_success
      expect(response).to have_http_status(:success)
    end

    it 'renders templates' do
      expect(response).to render_template('index')
    end

    it 'assigns photos to nil' do
      expect(assigns(:photos)).to be_nil
    end
  end

  describe '#search' do
    before { get :photos, params: search_params, xhr: true }

    context 'when empty keywords' do
      let(:search_params) { {} }

      it 'returns empty photos result' do
        expect(assigns(:photos)).to be_nil
      end

      it 'returns error flash message' do
        expect(response.headers['X-Message-Type']).to match('error')
        expect(response.headers['X-Message']).to_not be_nil
      end
    end

    context 'when search params is valid' do
      let(:search_params) { { keywords: 'ruby' } }

      it 'assigns photos result' do
        expect(assigns(:photos)).to_not be_nil
      end

      context 'when search type is invalid' do
        let(:search_params) { { keywords: 'ruby', search_type: 'sdclkjnsdc' } }

        it 'assigns photos result' do
          expect(assigns(:photos)).to be_nil
        end
      end

      context 'when search by text' do
        let(:search_params) { { keywords: 'ruby', search_type: Services::Searchers::Flickr::SEARCH_TYPES[:keywords] } }

        it 'assigns photos result' do
          expect(assigns(:photos)).to_not be_nil
        end
      end

      context 'when search by tags' do
        let(:search_params) { { keywords: 'ruby', search_type: Services::Searchers::Flickr::SEARCH_TYPES[:tags] } }

        it 'assigns photos result' do
          expect(assigns(:photos)).to_not be_nil
        end
      end
    end
  end
end
