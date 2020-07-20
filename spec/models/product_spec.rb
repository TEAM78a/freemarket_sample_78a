require 'rails_helper'

describe Product do
  # describe '#create' do
  #   context 'can save' do
  #     it "全ての必須項目が入力されている場合出品できる" do
  #     # # it "is valid with a name, introduce, price, kind_id, brand_id, condition_id, postage_id, shipment_id, prefecture_id, image" do
  #     #   product = FactoryBot.build(:product)
  #     #   expect(product).to be_valid
  #     end
  #   end

  #   context 'can not save' do
  #     it "is invalid without a name" do
  #       product = build(:product, name: "")
  #       product.valid?
  #       expect(product.errors[:name]).to include("can't be blank")
  #     end

  #     it "is invalid without an introduce" do
  #       product = build(:product, introduce: "")
  #       product.valid?
  #       expect(product.errors[:introduce]).to include("can't be blank")
  #     end

  #     it "is invalid without a price" do
  #       product = build(:product, price: "")
  #       product.valid?
  #       expect(product.errors[:price]).to include("can't be blank")
  #     end

  #     it "is invalid without a kind_id" do
  #       product = build(:product, kind_id: "")
  #       product.valid?
  #       expect(product.errors[:kind_id]).to include("can't be blank")
  #     end

  #     it "is invalid without a brand_id" do
  #       product = build(:product, brand_id: "")
  #       product.valid?
  #       expect(product.errors[:brand_id]).to include("can't be blank")
  #     end

  #     it "is invalid without a condition_id" do
  #       product = build(:product, condition_id: "")
  #       product.valid?
  #       expect(product.errors[:condition_id]).to include("can't be blank")
  #     end

  #     it "is invalid without a postage_id" do
  #       product = build(:product, postage_id: "")
  #       product.valid?
  #       expect(product.errors[:postage_id]).to include("can't be blank")
  #     end

  #     it "is invalid without a shipment_id" do
  #       product = build(:product, shipment_id: "")
  #       product.valid?
  #       expect(product.errors[:shipment_id]).to include("can't be blank")
  #     end

  #     it "is invalid without a prefecture_id" do
  #       product = build(:product, prefecture_id: "")
  #       product.valid?
  #       expect(product.errors[:prefecture_id]).to include("can't be blank")
  #     end

  #     it "is invalid without an image" do
  #       # image = build(:image, image: "")
  #       # image.valid?
  #       # expect(image.errors[:image]).to include("can't be blank")
  #     end


  #   end
  # end


  # describe "top_search" do
  #   before :all do
  #     Product.delete_all

  #     Product.create(name: "ミックス赤玉で豚玉を作ってみた")
  #     Product.create(name: "パルメザンチーズで濃厚カルボナーラ")
  #     Product.create(name: "ミックス赤玉で卵焼き")
  #     Product.create(name: "パプリカを使った野菜たっぷりスープ")

  #     Product.__elasticsearch__.import
  #     Product.__elasticsearch__.refresh_index!
  #   end

  #   context "when query is 'ミックス赤玉" do
  #     let(:query) { "ミックス赤玉" }
  #     let(:records) { Product.top_search(query).records }
  #     subject { records }
  #     it { should have(2).items }

  #     context "with names" do
  #       subject { records.map(&:name) }
  #       it { should match_array ["ミックス赤玉で豚玉を作ってみた", "ミックス赤玉で卵焼き"] }
  #     end
  #   end
  # end

  describe "category_search" do
    context 'when products searched' do
      before do
        create_list(:product, 100)
      end

      it "子要素での検索結果(孫要素を含む)を取得できる" do
        specify do
          @params[:q][:kind_cont] = '2,21,43,56,62,67,78,81,87,95,114,126,131,155,162,169,178,186,196'
          get :index, @params
          expect(assigns(:products)).to match_array([@data1])
        end
      end

      it "孫要素での検索結果を取得できる" do
        specify do
          @params[:q][:kind_cont] = '22'
          get :index, @params
          expect(assigns(:products)).to match_array([@data1])
        end
      end
      
    end
  end
end
