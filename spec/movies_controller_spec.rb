require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:valid_attributes) do
    {
      title: 'Willy Wonka & the Chocolate Factory',
      director: 'Mel Stuart',
      release_year: 1971
    }
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new Movie' do
        expect do
          post :create, params: { movie: valid_attributes }
        end.to change(Movie, :count).by(1)
      end

      it 'redirects to the root path with a notice' do
        post :create, params: { movie: valid_attributes }
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq("Movie 'Willy Wonka & the Chocolate Factory' has been added successfully!")
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new movie' do
        expect do
          post :create, params: { movie: { title: nil } }
        end.to change(Movie, :count).by(0)
      end

      it "renders the 'new' template with a notice" do
        post :create, params: { movie: { title: nil } }
        expect(response).to render_template('new')
        expect(flash[:notice]).to eq('There was an error')
      end
    end
  end
end
