require 'rails_helper'

describe Product do
  describe '#create' do
    context 'can save' do
      it "全ての必須項目が入力されている場合出品できる" do
      # it "is valid with a name, introduce, price, kind_id, brand_id, condition_id, postage_id, shipment_id, prefecture_id, image" do
        product = FactoryBot.build(:product)
        expect(product).to be_valid
      end
    end

    context 'can not save' do
      it "is invalid without a name" do
        product = build(:product, name: "")
        product.valid?
        expect(product.errors[:name]).to include("can't be blank")
      end

      it "is invalid without an introduce" do
        product = build(:product, introduce: "")
        product.valid?
        expect(product.errors[:introduce]).to include("can't be blank")
      end

      it "is invalid without a price" do
        product = build(:product, price: "")
        product.valid?
        expect(product.errors[:price]).to include("can't be blank")
      end

      it "is invalid without a kind_id" do
        product = build(:product, kind_id: "")
        product.valid?
        expect(product.errors[:kind_id]).to include("can't be blank")
      end

      it "is invalid without a brand_id" do
        product = build(:product, brand_id: "")
        product.valid?
        expect(product.errors[:brand_id]).to include("can't be blank")
      end

      it "is invalid without a condition_id" do
        product = build(:product, condition_id: "")
        product.valid?
        expect(product.errors[:condition_id]).to include("can't be blank")
      end

      it "is invalid without a postage_id" do
        product = build(:product, postage_id: "")
        product.valid?
        expect(product.errors[:postage_id]).to include("can't be blank")
      end

      it "is invalid without a shipment_id" do
        product = build(:product, shipment_id: "")
        product.valid?
        expect(product.errors[:shipment_id]).to include("can't be blank")
      end

      it "is invalid without a prefecture_id" do
        product = build(:product, prefecture_id: "")
        product.valid?
        expect(product.errors[:prefecture_id]).to include("can't be blank")
      end

      it "is invalid without an image" do
        image = build(:image, image: "")
        image.valid?
        expect(image.errors[:image]).to include("can't be blank")
      end


    end
  end
end

