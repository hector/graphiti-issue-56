require 'rails_helper'

RSpec.describe "voiceovers#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/voiceovers", params: params
  end

  describe 'basic fetch' do
    let!(:voiceover1) { create(:voiceover) }
    let!(:voiceover2) { create(:voiceover) }

    it 'works' do
      expect(VoiceoverResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.map(&:jsonapi_type).uniq).to match_array(['voiceovers'])
      expect(d.map(&:id)).to match_array([voiceover1.id, voiceover2.id])
    end
  end
end
