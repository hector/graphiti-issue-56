require 'rails_helper'

RSpec.describe "dubbings#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/dubbings/#{dubbing.id}"
  end

  describe 'basic destroy' do
    let!(:dubbing) { create(:dubbing) }

    it 'updates the resource' do
      expect(DubbingResource).to receive(:find).and_call_original
      expect { make_request }.to change { Dubbing.count }.by(-1)
      expect { dubbing.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(response.status).to eq(200)
      expect(json).to eq('meta' => {})
    end
  end
end
