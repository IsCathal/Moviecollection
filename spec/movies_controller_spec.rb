require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let!(:genre) { Genre.create!(name: 'Sci-Fi') }

  let(:valid_attributes) do
    {
      title: 'Willy Wonka & the Chocolate Factory',
      director: 'Mel Stuart',
      release_year: 1971,
      genre_ids: [genre.id]
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

    describe 'GET #index' do
      it 'returns a success response' do
        Movie.create! valid_attributes
        get :index
        expect(response).to be_successful
      end
    end

    describe 'GET #new' do
      it 'returns a success response' do
        get :new
        expect(response).to be_successful
      end
      it 'assigns a new movie to @movie' do
        get :new
        expect(assigns(:movie)).to be_a_new(Movie)
      end
    end

    describe 'PATCH/PUT #update' do
      let(:movie) { Movie.create! valid_attributes }

      context 'with valid parameters' do
        let(:new_attributes) do
          {
            view_count: 500
          }
        end

        it 'updates the requested movie' do
          patch :update, params: { id: movie.to_param, movie: new_attributes }
          movie.reload
          expect(movie.view_count).to eq(500)
        end

        it 'redirects to the root path with a notice' do
          patch :update, params: { id: movie.to_param, movie: new_attributes }
          movie.reload
          expect(response).to redirect_to(root_path)
          expect(flash[:notice]).to eq("Movie 'Willy Wonka & the Chocolate Factory' views updated successfully!")
        end
      end
    end
  end
end
