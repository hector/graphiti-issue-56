require 'rails_helper'

RSpec.describe DubbingResource, type: :resource do
  describe 'serialization' do
    let!(:dubbing) { create(:dubbing) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(dubbing.id)
      expect(data.jsonapi_type).to eq('dubbings')
    end
  end

  describe 'filtering' do
    let!(:dubbing1) { create(:dubbing) }
    let!(:dubbing2) { create(:dubbing) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: dubbing2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([dubbing2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:dubbing1) { create(:dubbing) }
      let!(:dubbing2) { create(:dubbing) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            dubbing1.id,
            dubbing2.id
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
            dubbing2.id,
            dubbing1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
