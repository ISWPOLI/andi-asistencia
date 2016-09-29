class ImportingController < ApplicationController

  def import_sales
    file = request(:file)
    importer = PaymentImportation.new
    importer.import_xls(file)
  end

end
