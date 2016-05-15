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
    
    def lista
        @list_comp = List.new
        @mostra = Manage.find(params[:id])
        
    end
    
    def create
        @list_comp = List.new(list_params)

        respond_to do |format|
            if @list_comp.save
                format.html { redirect_to @list_comp, notice: 'Prato criado com sucesso.' }
                format.json { render :show, status: :created, location: @list_comp }
            else
                format.html { render :new }
                format.json { render json: @list_comp.errors, status: :unprocessable_entity }
            end
        end
    end
    
    
    
    private
        def list_params
            params.require(:list).permit(:namep, :qtd, :price, :total)
        end
end