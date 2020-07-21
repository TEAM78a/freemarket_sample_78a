class Card < ApplicationRecord
  belongs_to :user, optional: true

  validates :customer_id, :card_id, presence: true

  def self.cardnunmer(customer_id, card_id)
    credit = {}
    customer = Payjp::Customer.retrieve(customer_id)
    @customer_card = customer.cards.retrieve(card_id)

    credit[:last4] = @customer_card.last4.to_s
    credit[:exp_month] = @customer_card.exp_month.to_s
    credit[:exp_year] = @customer_card.exp_year.to_s.slice(2,3)
    case @customer_card.brand
    when "Visa"
      credit[:src] = "cards/visa.svg"
    when "JCB"
      credit[:src] = "cards/jcb.svg"
    when "MasterCard"
      credit[:src] = "cards/master-card.svg"
    when "American Express"
      credit[:src] = "cards/american_express.svg"
    when "Diners Club"
      credit[:src] = "cards/dinersclub.svg"
    when "Discover"
      credit[:src] = "cards/discover.svg"
    end
    return credit
  end
end
