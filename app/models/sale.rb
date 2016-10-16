class Sale < ApplicationRecord

  belongs_to :client
  belongs_to :campaign

  def to_s
    self.card_number
  end

end
