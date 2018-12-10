require 'rails_helper'

RSpec.describe VoiceoverProjectResource, type: :resource do
  describe 'serialization' do
    let!(:voiceover_project) { create(:voiceover_project) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(voiceover_project.id)
      expect(data.jsonapi_type).to eq('voiceover_projects')
    end
  end

  describe 'filtering' do
    let!(:voiceover_project1) { create(:voiceover_project) }
    let!(:voiceover_project2) { create(:voiceover_project) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: voiceover_project2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([voiceover_project2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:voiceover_project1) { create(:voiceover_project) }
      let!(:voiceover_project2) { create(:voiceover_project) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            voiceover_project1.id,
            voiceover_project2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            voiceover_project2.id,
            voiceover_project1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
