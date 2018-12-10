require 'rails_helper'

RSpec.describe VoiceoverResource, type: :resource do
  describe 'serialization' do
    let!(:voiceover) { create(:voiceover) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(voiceover.id)
      expect(data.jsonapi_type).to eq('voiceovers')
    end
  end

  describe 'filtering' do
    let!(:voiceover1) { create(:voiceover) }
    let!(:voiceover2) { create(:voiceover) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: voiceover2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([voiceover2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:voiceover1) { create(:voiceover) }
      let!(:voiceover2) { create(:voiceover) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            voiceover1.id,
            voiceover2.id
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
            voiceover2.id,
            voiceover1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
