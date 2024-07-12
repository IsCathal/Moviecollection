require 'rails_helper'

RSpec.describe GenresController, type: :controller do
  let!(:valid_attributes) do
    {
      name: 'Drama'
    }
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
    end
    it 'assigns a new movie to @movie' do
      get :new
      expect(assigns(:genre)).to be_a_new(Genre)
    end
  end

  describe 'POST #create' do
    context 'with valid parameters' do
      it 'creates a new genre' do
        expect do
          post :create, params: { genre: valid_attributes }
        end.to change(Genre, :count).by(1)
      end

      it 'redirects to the root path with a notice' do
        post :create, params: { genre: valid_attributes }
        expect(response).to redirect_to(root_path)
        expect(flash[:notice]).to eq('Genre was successfully created')
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new movie' do
        expect do
          post :create, params: { genre: { name: nil } }
        end.to change(Genre, :count).by(0)
      end

      it "renders the 'new' template with a notice" do
        post :create, params: { genre: { name: nil } }
        expect(response).to render_template('new')
        expect(flash[:notice]).to eq('There was an error')
      end
    end
  end
end
