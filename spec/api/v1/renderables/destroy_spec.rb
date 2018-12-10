require 'rails_helper'

RSpec.describe "renderables#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/renderables/#{renderable.id}"
  end

  describe 'basic destroy' do
    let!(:renderable) { create(:renderable) }

    it 'updates the resource' do
      expect(RenderableResource).to receive(:find).and_call_original
      expect { make_request }.to change { Renderable.count }.by(-1)
      expect { renderable.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(response.status).to eq(200)
      expect(json).to eq('meta' => {})
    end
  end
end
