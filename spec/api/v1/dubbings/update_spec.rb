require 'rails_helper'

RSpec.describe "dubbings#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/dubbings/#{dubbing.id}", payload
  end

  describe 'basic update' do
    let!(:dubbing) { create(:dubbing) }

    let(:payload) do
      {
        data: {
          id: dubbing.id.to_s,
          type: 'dubbings',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(DubbingResource).to receive(:find).and_call_original
      expect {
        make_request
      }.to change { dubbing.reload.attributes }
      expect(response.status).to eq(200)
    end
  end
end
