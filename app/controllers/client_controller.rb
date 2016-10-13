class ClientController < ApplicationController

  def index
    @client_list = Client.where(is_active: true)

    if params[:status] == 'inactive'
      @client_list = Client.where(is_active: false)
    end
  end

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
