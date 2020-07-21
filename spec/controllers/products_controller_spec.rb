require 'rails_helper'

describe ProductsController do
  let(:user) { create(:user) }

  describe '#index' do
    context 'log in' do
      it "populates an array of products" do
        products = create_list(:product, 3) 
        get :index
        expect(response).to render_template :index
        expect(assigns(:products)).to match(products)
      end

      it "renders the :index template" do

      end
    end
  end
end


