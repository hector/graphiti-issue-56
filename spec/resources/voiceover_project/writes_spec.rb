require 'rails_helper'

RSpec.describe VoiceoverProjectResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'voiceover_projects',
          attributes: { }
        }
      }
    end

    let(:instance) do
      VoiceoverProjectResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true)
      }.to change { VoiceoverProject.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:voiceover_project) { create(:voiceover_project) }

    let(:payload) do
      {
        data: {
          id: voiceover_project.id.to_s,
          type: 'voiceover_projects',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      VoiceoverProjectResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { voiceover_project.reload.updated_at }
      # .and change { voiceover_project.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:voiceover_project) { create(:voiceover_project) }

    let(:instance) do
      VoiceoverProjectResource.find(id: voiceover_project.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { VoiceoverProject.count }.by(-1)
    end
  end
end
