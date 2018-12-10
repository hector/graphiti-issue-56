require 'rails_helper'

RSpec.describe "voiceovers#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/voiceovers", payload
  end

  describe 'basic create' do
    let(:payload) do
      {
        data: {
          type: 'voiceovers',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    it 'works' do
      expect(VoiceoverResource).to receive(:build).and_call_original
      expect {
        make_request
      }.to change { Voiceover.count }.by(1)
      expect(response.status).to eq(201)
    end
  end
end
