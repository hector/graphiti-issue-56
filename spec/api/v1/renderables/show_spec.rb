require 'rails_helper'

RSpec.describe "renderables#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/renderables/#{renderable.id}", params: params
  end

  describe 'basic fetch' do
    let!(:renderable) { create(:renderable) }

    it 'works' do
      expect(RenderableResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('renderables')
      expect(d.id).to eq(renderable.id)
    end
  end
end
