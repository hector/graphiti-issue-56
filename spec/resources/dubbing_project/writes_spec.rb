require 'rails_helper'

RSpec.describe DubbingProjectResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'dubbing_projects',
          attributes: { }
        }
      }
    end

    let(:instance) do
      DubbingProjectResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true)
      }.to change { DubbingProject.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:dubbing_project) { create(:dubbing_project) }

    let(:payload) do
      {
        data: {
          id: dubbing_project.id.to_s,
          type: 'dubbing_projects',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      DubbingProjectResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { dubbing_project.reload.updated_at }
      # .and change { dubbing_project.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:dubbing_project) { create(:dubbing_project) }

    let(:instance) do
      DubbingProjectResource.find(id: dubbing_project.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { DubbingProject.count }.by(-1)
    end
  end
end
