require 'rails_helper'

RSpec.describe "dubbing_projects#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/dubbing_projects", params: params
  end

  describe 'basic fetch' do
    let!(:dubbing_project1) { create(:dubbing_project) }
    let!(:dubbing_project2) { create(:dubbing_project) }

    it 'works' do
      expect(DubbingProjectResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.map(&:jsonapi_type).uniq).to match_array(['dubbing_projects'])
      expect(d.map(&:id)).to match_array([dubbing_project1.id, dubbing_project2.id])
    end
  end
end
