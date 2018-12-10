require 'rails_helper'

RSpec.describe "dubbings#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/dubbings", params: params
  end

  describe 'basic fetch' do
    let!(:dubbing1) { create(:dubbing) }
    let!(:dubbing2) { create(:dubbing) }

    it 'works' do
      expect(DubbingResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.map(&:jsonapi_type).uniq).to match_array(['dubbings'])
      expect(d.map(&:id)).to match_array([dubbing1.id, dubbing2.id])
    end
  end
end
