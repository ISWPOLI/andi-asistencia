class PaymentImportation < Importation

  def do_with_row(hash)
    Payment.create(hash)
  end

end
