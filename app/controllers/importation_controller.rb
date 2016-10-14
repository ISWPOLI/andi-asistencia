class ImportationController < ApplicationController

  def sales
  end

  def import_sales_xls
    file = params[:file]
    importer = SaleImportation.new
    message = importer.import_xls(file.path)

    redirect_to sales_path, notice: message
  end

end
