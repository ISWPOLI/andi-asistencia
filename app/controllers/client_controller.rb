class ClientController < ApplicationController

  #
  # Shows the list of clients in the app
  #
  def index
    @client_list = Client.where(is_active: true)
    is_active = true
    filename = 'clientes-activos'

    if params[:status] == 'inactive'
      is_active = false
      filename = 'clientes-inactivos'
      @client_list = Client.where(is_active: false)
    end

    respond_to do |format|
      format.csv { send_data Client.to_csv(is_active: is_active), filename: "#{filename}.csv" }
      format.html { render :index }
    end
  end

  #
  # Displays the detail page of a client.
  #
  def show
    @client = Client.find(params[:id])
  end

  #
  # Deactivates a client changeing `is_active` to false.
  #
  def deactivate
    @client = Client.find(params[:client_id])
    @client.is_active = false

    if @client.save
      redirect_to client_path(@client), notice: 'El cliente fue desactivado'
    else
      redirect_to client_path(@client), notice: 'No pudimos deactivar este cliente'
    end
  end

end
