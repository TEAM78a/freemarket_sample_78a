require 'rails_helper'

describe ProductsController do
  let(:invalid_params) { { user_id: user.id, image: attributes_for(:image, image: File.open("#{Rails.root}/public/images/test_image.jpg")) } }

  # it "assigns the requested tweet to @product" do
  #   product = create(:product)
  #   get :edit, params: { id: product }
  #   expect(assigns(:product)).to eq product
  # end

  context 'not log in' do
    it 'redirects to new_user_session_path' do
      post :edit, params: params
      expect(response).to redirect_to(root_path)
    end
  end
end


