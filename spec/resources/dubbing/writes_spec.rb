require 'rails_helper'

RSpec.describe DubbingResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'dubbings',
          attributes: { }
        }
      }
    end

    let(:instance) do
      DubbingResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true)
      }.to change { Dubbing.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:dubbing) { create(:dubbing) }

    let(:payload) do
      {
        data: {
          id: dubbing.id.to_s,
          type: 'dubbings',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      DubbingResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { dubbing.reload.updated_at }
      # .and change { dubbing.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:dubbing) { create(:dubbing) }

    let(:instance) do
      DubbingResource.find(id: dubbing.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Dubbing.count }.by(-1)
    end
  end
end
