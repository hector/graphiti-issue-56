require 'rails_helper'

RSpec.describe "renderables#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/renderables", payload
  end

  describe 'basic create' do
    let(:payload) do
      {
        data: {
          type: 'renderables',
          attributes: {
            # ... your attrs here
          }
        }
      }
    end

    it 'works' do
      expect(RenderableResource).to receive(:build).and_call_original
      expect {
        make_request
      }.to change { Renderable.count }.by(1)
      expect(response.status).to eq(201)
    end
  end
end
