class PaymentImportation < Importation

  def initialize
    @columns = {
      first_name: 'Nombres',
      last_name: 'Apellidos',
      document_number: 'Cédula',
      cellphone_number: 'Celular',
      sale_date: 'Fecha',
      amount: 'Valor',
      sale_id: 'Venta'
    }
    @payments = 0
  end

  def process_row(hash)
    client = Client.find_by_document_number(hash[:document_number])
    @payments = @payments + 1
    return if client.nil?

    sale = Sale.find(hash[:sale_id])
    return if sale.nil?

    hash[:client] = client
    hash[:sale] = sale

    if client.payments.empty?
      hash[:start_date] = sale.created_at
      hash[:end_date] = sale.created_at + 1.month
    else
      last_payment = client.payments.last
      hash[:start_date] = last_payment.end_date + 1.day
      hash[:end_date] = last_payment.end_date + 1.month
    end

    payment = Payment.create(
      hash.pick(
        :client,
        :sale,
        :payment_date,
        :start_date,
        :end_date
      )
    )

  end

  def success_message()
    "#{@payments} pagos fueron procesados."
  end

end
