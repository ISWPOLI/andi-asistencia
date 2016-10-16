class SaleImportation < Importation

  def initialize
    @columns = {
      first_name: 'Nombres',
      last_name: 'Apellidos',
      document_number: 'Cédula',
      cellphone_number: 'Celular',
      campaign: 'Campana',
      address: 'Direccion',
      city: 'Ciudad',
      sale_date: 'Fecha de venta',
      amount: 'Valor',
      card_number: 'No tarjeta'
    }

    @clients = 0
  end

  def process_row(hash)
    hash = hash.merge({is_active: true})

    if Client.find_by_document_number(hash[:document_number])
      @clients = @clients + 1
      return
    end

    # Campaign
    campaign = Campaign.find_or_create_by(
      name: hash[:campaign]
    )

    hash[:campaign] = campaign

    # Client.
    client = Client.create(
      hash.pick(
        :first_name,
        :last_name,
        :document_number,
        :cellphone_number,
        :campaign,
        :address,
        :city,
        :is_active
      )
    )

    # Create sale.
    Sale.create(
      client: client,
      campaign: campaign,
      amount: hash[:amount],
      card_number: hash[:card_number],
      sale_date: hash[:sale_date]
    )

    @clients = @clients + 1
  end

  def success_message()
    "#{@clients} ventas fueron procesadas."
  end

end
