class MenuclienteController < ApplicationController
    def pedidos
        @lista_ped = Order.where("n_table = 'mesas'")
    end
    def pratos
       @escolha_ped = Manage.all
    end
    
    # GET /menucliente/1
    # GET /menucliente/1.json
    def show
        @mostra = Manage.find(params[:id])
    end
end
