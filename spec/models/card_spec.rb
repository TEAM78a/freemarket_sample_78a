require 'rails_helper'

describe Product do
  describe '#create' do
    context 'can save' do
      it "is valid with a customer_id, card_id" do
        product = FactoryBot.build(:card)
        expect(card).to be_valid
      end
    end

    context 'can not save' do
      it "is invalid without a customer_id" do
        card = build(:card, customer_id: "")
        card.valid?
        expect(card.errors[:customer_id]).to include("can't be blank")
      end

      it "is invalid without an card_id" do
        card = build(:card, card_id: "")
        card.valid?
        expect(card.errors[:card_id]).to include("can't be blank")
      end

    end
  end
end

