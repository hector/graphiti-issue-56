require 'rails_helper'

RSpec.describe "renderables#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/renderables", params: params
  end

  describe 'basic fetch' do
    let!(:renderable1) { create(:renderable) }
    let!(:renderable2) { create(:renderable) }

    it 'works' do
      expect(RenderableResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.map(&:jsonapi_type).uniq).to match_array(['renderables'])
      expect(d.map(&:id)).to match_array([renderable1.id, renderable2.id])
    end
  end
end
