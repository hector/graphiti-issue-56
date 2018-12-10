require 'rails_helper'

RSpec.describe "dubbings#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/dubbings/#{dubbing.id}", params: params
  end

  describe 'basic fetch' do
    let!(:dubbing) { create(:dubbing) }

    it 'works' do
      expect(DubbingResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('dubbings')
      expect(d.id).to eq(dubbing.id)
    end
  end
end
