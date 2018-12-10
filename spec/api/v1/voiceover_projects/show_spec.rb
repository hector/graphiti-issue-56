require 'rails_helper'

RSpec.describe "voiceover_projects#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/voiceover_projects/#{voiceover_project.id}", params: params
  end

  describe 'basic fetch' do
    let!(:voiceover_project) { create(:voiceover_project) }

    it 'works' do
      expect(VoiceoverProjectResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('voiceover_projects')
      expect(d.id).to eq(voiceover_project.id)
    end
  end
end
