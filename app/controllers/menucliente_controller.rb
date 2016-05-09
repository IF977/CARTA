class MenuclienteController < ApplicationController
    def pedidos
        @lista_ped = Order.where("n_table = 'mesas'")
    end
    def pratos
       @escolha_ped = Manage.last
    end
end
