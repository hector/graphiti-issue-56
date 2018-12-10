require 'rails_helper'

RSpec.describe "voiceover_projects#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/voiceover_projects/#{voiceover_project.id}", payload
  end

  describe 'basic update' do
    let!(:voiceover_project) { create(:voiceover_project) }

    let(:payload) do
      {
        data: {
          id: voiceover_project.id.to_s,
          type: 'voiceover_projects',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(VoiceoverProjectResource).to receive(:find).and_call_original
      expect {
        make_request
      }.to change { voiceover_project.reload.attributes }
      expect(response.status).to eq(200)
    end
  end
end
