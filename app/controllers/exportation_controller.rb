class ExportationController < ApplicationController

  def generate_bills
  end


  #
  # These files are generated with clients that have no payments
  # in an specific range.
  #
  def generate_charges
    xls_path = ActionController::Base.helpers.asset_path('spreadsheets/archivo_de_cobros.xlsx')
    xlsx = Roo::Spreadsheet.open(xls_path)
    send_data xlsx.to_csv
  end

end
