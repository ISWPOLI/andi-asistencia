class Sale < ApplicationRecord

  belongs_to :client
  belongs_to :campaign

end
