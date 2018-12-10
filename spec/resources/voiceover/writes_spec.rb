require 'rails_helper'

RSpec.describe VoiceoverResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'voiceovers',
          attributes: { }
        }
      }
    end

    let(:instance) do
      VoiceoverResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true)
      }.to change { Voiceover.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:voiceover) { create(:voiceover) }

    let(:payload) do
      {
        data: {
          id: voiceover.id.to_s,
          type: 'voiceovers',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      VoiceoverResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { voiceover.reload.updated_at }
      # .and change { voiceover.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:voiceover) { create(:voiceover) }

    let(:instance) do
      VoiceoverResource.find(id: voiceover.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Voiceover.count }.by(-1)
    end
  end
end
