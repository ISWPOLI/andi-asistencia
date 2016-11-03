class ImportationController < ApplicationController

  def sales
  end
  
  # 
  # Main action to import sales files.
  #
  def import_sales_xls
    file = params[:file]
    importer = SaleImportation.new
    message = importer.import_xls(file.path)

    redirect_to sales_path, notice: message
  end

  def payments
  end
  
  #
  # Import payments file
  #
  def import_payments_xls
    file = params[:file]
    importer = PaymentImportation.new
    message = importer.import_xls(file.path)

    redirect_to payments_path, notice: message
  end

end
