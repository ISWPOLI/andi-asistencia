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

end
