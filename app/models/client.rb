class Client < ApplicationRecord
  belongs_to :campaign

  has_many :payments
end
