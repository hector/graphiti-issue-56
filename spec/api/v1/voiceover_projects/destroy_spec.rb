require 'rails_helper'

RSpec.describe "voiceover_projects#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/voiceover_projects/#{voiceover_project.id}"
  end

  describe 'basic destroy' do
    let!(:voiceover_project) { create(:voiceover_project) }

    it 'updates the resource' do
      expect(VoiceoverProjectResource).to receive(:find).and_call_original
      expect { make_request }.to change { VoiceoverProject.count }.by(-1)
      expect { voiceover_project.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(response.status).to eq(200)
      expect(json).to eq('meta' => {})
    end
  end
end
