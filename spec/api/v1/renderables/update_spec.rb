require 'rails_helper'

RSpec.describe "renderables#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/renderables/#{renderable.id}", payload
  end

  describe 'basic update' do
    let!(:renderable) { create(:renderable) }

    let(:payload) do
      {
        data: {
          id: renderable.id.to_s,
          type: 'renderables',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit 'updates the resource' do
      expect(RenderableResource).to receive(:find).and_call_original
      expect {
        make_request
      }.to change { renderable.reload.attributes }
      expect(response.status).to eq(200)
    end
  end
end
