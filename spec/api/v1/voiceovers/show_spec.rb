require 'rails_helper'

RSpec.describe "voiceovers#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/voiceovers/#{voiceover.id}", params: params
  end

  describe 'basic fetch' do
    let!(:voiceover) { create(:voiceover) }

    it 'works' do
      expect(VoiceoverResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('voiceovers')
      expect(d.id).to eq(voiceover.id)
    end
  end
end
