require 'rails_helper'

RSpec.describe DubbingProjectResource, type: :resource do
  describe 'serialization' do
    let!(:dubbing_project) { create(:dubbing_project) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(dubbing_project.id)
      expect(data.jsonapi_type).to eq('dubbing_projects')
    end
  end

  describe 'filtering' do
    let!(:dubbing_project1) { create(:dubbing_project) }
    let!(:dubbing_project2) { create(:dubbing_project) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: dubbing_project2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([dubbing_project2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:dubbing_project1) { create(:dubbing_project) }
      let!(:dubbing_project2) { create(:dubbing_project) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            dubbing_project1.id,
            dubbing_project2.id
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
            dubbing_project2.id,
            dubbing_project1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
