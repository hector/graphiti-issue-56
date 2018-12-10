require 'rails_helper'

RSpec.describe RenderableResource, type: :resource do
  describe 'serialization' do
    let!(:renderable) { create(:renderable) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(renderable.id)
      expect(data.jsonapi_type).to eq('renderables')
    end
  end

  describe 'filtering' do
    let!(:renderable1) { create(:renderable) }
    let!(:renderable2) { create(:renderable) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: renderable2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([renderable2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:renderable1) { create(:renderable) }
      let!(:renderable2) { create(:renderable) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            renderable1.id,
            renderable2.id
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
            renderable2.id,
            renderable1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
