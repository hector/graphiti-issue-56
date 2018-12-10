require 'rails_helper'

RSpec.describe "dubbing_projects#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/dubbing_projects/#{dubbing_project.id}"
  end

  describe 'basic destroy' do
    let!(:dubbing_project) { create(:dubbing_project) }

    it 'updates the resource' do
      expect(DubbingProjectResource).to receive(:find).and_call_original
      expect { make_request }.to change { DubbingProject.count }.by(-1)
      expect { dubbing_project.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(response.status).to eq(200)
      expect(json).to eq('meta' => {})
    end
  end
end
