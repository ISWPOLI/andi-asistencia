class Payment < ApplicationRecord

  belongs_to :client
  belongs_to :sale

end
