require 'rails_helper'

RSpec.describe RenderableResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'renderables',
          attributes: { }
        }
      }
    end

    let(:instance) do
      RenderableResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true)
      }.to change { Renderable.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:renderable) { create(:renderable) }

    let(:payload) do
      {
        data: {
          id: renderable.id.to_s,
          type: 'renderables',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      RenderableResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { renderable.reload.updated_at }
      # .and change { renderable.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:renderable) { create(:renderable) }

    let(:instance) do
      RenderableResource.find(id: renderable.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Renderable.count }.by(-1)
    end
  end
end
