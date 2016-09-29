class SaleImportation < Importation

  def process_row(hash)
    User.create(hash)
  end

end
