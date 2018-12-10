require 'rails_helper'

RSpec.describe "voiceovers#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/voiceovers/#{voiceover.id}", payload
  end

  describe 'basic update' do
    let!(:voiceover) { create(:voiceover) }

    let(:payload) do
      {
        data: {
          id: voiceover.id.to_s,
          type: 'voiceovers',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(VoiceoverResource).to receive(:find).and_call_original
      expect {
        make_request
      }.to change { voiceover.reload.attributes }
      expect(response.status).to eq(200)
    end
  end
end
