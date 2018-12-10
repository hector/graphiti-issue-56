require 'rails_helper'

RSpec.describe "dubbing_projects#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/dubbing_projects/#{dubbing_project.id}", params: params
  end

  describe 'basic fetch' do
    let!(:dubbing_project) { create(:dubbing_project) }

    it 'works' do
      expect(DubbingProjectResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq('dubbing_projects')
      expect(d.id).to eq(dubbing_project.id)
    end
  end
end
