require 'rails_helper'

RSpec.describe "dubbing_projects#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/dubbing_projects", payload
  end

  describe 'basic create' do
    let(:payload) do
      {
        data: {
          type: 'dubbing_projects',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    it 'works' do
      expect(DubbingProjectResource).to receive(:build).and_call_original
      expect {
        make_request
      }.to change { DubbingProject.count }.by(1)
      expect(response.status).to eq(201)
    end
  end
end
