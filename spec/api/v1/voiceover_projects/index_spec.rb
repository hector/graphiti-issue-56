require 'rails_helper'

RSpec.describe "voiceover_projects#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/voiceover_projects", params: params
  end

  describe 'basic fetch' do
    let!(:voiceover_project1) { create(:voiceover_project) }
    let!(:voiceover_project2) { create(:voiceover_project) }

    it 'works' do
      expect(VoiceoverProjectResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.map(&:jsonapi_type).uniq).to match_array(['voiceover_projects'])
      expect(d.map(&:id)).to match_array([voiceover_project1.id, voiceover_project2.id])
    end
  end
end
