class PaymentImportation < Importation

  def process_row(hash)
    Payment.create(hash)
  end

end
