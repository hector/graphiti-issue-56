require 'rails_helper'

RSpec.describe "voiceovers#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/voiceovers/#{voiceover.id}"
  end

  describe 'basic destroy' do
    let!(:voiceover) { create(:voiceover) }

    it 'updates the resource' do
      expect(VoiceoverResource).to receive(:find).and_call_original
      expect { make_request }.to change { Voiceover.count }.by(-1)
      expect { voiceover.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(response.status).to eq(200)
      expect(json).to eq('meta' => {})
    end
  end
end
