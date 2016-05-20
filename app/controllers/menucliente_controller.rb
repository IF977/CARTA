class MenuclienteController < ApplicationController
#    before_action :passvalue, only: [:lista]
    
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
    
    def list
        
        @list_comp = List.new
        @mostra = Manage.find(params[:id])
        @list_comp.qtd = params[:qtds]
        @list_comp.total = (params[:qtds]).to_i * (@mostra.price).to_i
        @list_comp.manage_id = params[:id]
        @list_comp.namep = @mostra.name
        @list_comp.price = @mostra.price
        $mesa = @list_comp.mesa_n = params[:mesa]
        @list_comp.save

        redirect_to lista_menucliente_path
        
    end
    
    def lista
        @list_compx = List.where(mesa_n: $mesa)
        
    end
    
    def limplista
        @list_compx = List.where(mesa_n: $mesa)
        @list_compx.each do |x|
            x.destroy
        end
        redirect_to lista_menucliente_path
        
    end
    #def most
    #    @list_comp = List.where(mesa_n: params[:mesa])
         
    #end
    
    def destroy
        
            @del = List.find(params[:id])
            @del.destroy
            
            respond_to do |format|
                format.html { redirect_to lista_menucliente_path, notice: 'Iten deletado com sucesso.' }
                #format.html { redirect_to :back, notice: 'Iten deletado com sucesso.' }
                format.json { head :no_content }
            end
        #else
        #    @del = List.where(mesa_n: params[:mesa])
        #    @del.each do |dest|
        #        dest.destroy
        #    end
            
        #    respond_to do |format|
        #        format.html { redirect_to lista_menucliente_index_path, notice: 'Itens deletados com sucesso.' }
        #        format.json { head :no_content }
        #    end
        #end
    end
    
    private
        
        def list_params
            params.require(:list).permit(:id, :namep, :qtd, :price, :total)
        end
    
end

    