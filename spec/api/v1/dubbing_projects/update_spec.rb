require 'rails_helper'

RSpec.describe "dubbing_projects#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/dubbing_projects/#{dubbing_project.id}", payload
  end

  describe 'basic update' do
    let!(:dubbing_project) { create(:dubbing_project) }

    let(:payload) do
      {
        data: {
          id: dubbing_project.id.to_s,
          type: 'dubbing_projects',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(DubbingProjectResource).to receive(:find).and_call_original
      expect {
        make_request
      }.to change { dubbing_project.reload.attributes }
      expect(response.status).to eq(200)
    end
  end
end
