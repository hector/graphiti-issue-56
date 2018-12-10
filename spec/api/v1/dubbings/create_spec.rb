require 'rails_helper'

RSpec.describe "dubbings#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/dubbings", payload
  end

  describe 'basic create' do
    let(:payload) do
      {
        data: {
          type: 'dubbings',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    it 'works' do
      expect(DubbingResource).to receive(:build).and_call_original
      expect {
        make_request
      }.to change { Dubbing.count }.by(1)
      expect(response.status).to eq(201)
    end
  end
end
