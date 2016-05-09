class MenuclienteController < ApplicationController
    def pedidos
        @lista_ped = Order.where("n_table = 'mesas'")
    end
    def pratos
       @escolha_ped = Dish.first
    end
end
