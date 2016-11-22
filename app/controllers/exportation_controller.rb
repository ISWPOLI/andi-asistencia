class ExportationController < ApplicationController

  def generate_bills
  end

  #
  # These files are generated with clients that have no payments in the current
  # month. The charge information is intended to be sent to the entity
  # that makes the charges.
  #
  def generate_charges

    respond_to do |format|
      format.csv { send_data Client.pendign_payments_csv, filename: 'archivo-de-cobros.csv' }
    end
  end

end
