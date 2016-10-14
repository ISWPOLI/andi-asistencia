class PaymentImportation < Importation

  def initialize
    @columns = {
      first_name: 'Nombres',
      last_name: 'Apellidos',
      document_number: 'Cédula',
      cellphone_number: 'Celular',
      campaign: 'Campana',
      address: 'Direccion',
      city: 'Ciudad',
      # sale_date: 'Fecha de venta',
      # amount: 'Valor',
      # card_number: 'No tarjeta'
    }
  end

  def process_row(hash)
    hash = hash.merge({is_active: true})
    if Client.find_by_document_number(hash[:document_number])
      return
    end

    client = Client.create(hash)
    puts client.inspect
  end

end
