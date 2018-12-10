require 'rails_helper'

RSpec.describe "voiceover_projects#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/voiceover_projects", payload
  end

  describe 'basic create' do
    let(:payload) do
      {
        data: {
          type: 'voiceover_projects',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    it 'works' do
      expect(VoiceoverProjectResource).to receive(:build).and_call_original
      expect {
        make_request
      }.to change { VoiceoverProject.count }.by(1)
      expect(response.status).to eq(201)
    end
  end
end
