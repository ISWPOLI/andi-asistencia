class Client < ApplicationRecord
  belongs_to :campaign
  has_many :sales

  has_many :payments

  def self.pendign_payments_csv
    attributes = [
      'Nombres', 'Apellidos', 'Cédula',
      'Celular', 'Campana', 'Direccion',
      'Ciudad', 'Fecha de venta',
      'Valor', 'No tarjeta'
    ]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      self.with_pending_charges.each do |client|
        csv << [
          client.first_name,
          client.last_name,
          client.document_number,
          client.cellphone_number,
          client.campaign.name,
          client.address,
          client.city,
          client.sales.first.created_at,
          client.sales.first.amount,
          client.sales.first.card_number,
        ]
      end
    end
  end

  #
  # Return a list of clients that have payments.
  #
  def self.with_pending_charges
    # Clients that that have payments but the last one last date is before today.
    clients_with_active_payments = Payment.where("end_date > ?", Time.zone.now.end_of_day).distinct().pluck('client_id')

    # Clients that have no payments.
    Client.includes(:payments).where(payments: {client_id: nil}) +  Client.where(
      is_active: true,
    ).where.not(
      id: [clients_with_active_payments]
    )
  end


  def self.to_csv(is_active: true)
    attributes = [
      'Nombres', 'Apellidos', 'Cédula',
      'Celular', 'Campana', 'Direccion', 'Ciudad'
    ]

    CSV.generate(headers: true) do |csv|
      csv << attributes

      Client.where(is_active: is_active).each do |client|
        csv << [
          client.first_name,
          client.last_name,
          client.document_number,
          client.cellphone_number,
          client.campaign.name,
          client.address,
          client.city
        ]
      end
    end
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end

end
