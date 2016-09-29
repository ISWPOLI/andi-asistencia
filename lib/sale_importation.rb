class SaleImportation < Importation

  def do_with_row(hash)
    User.create(hash)
  end

end
