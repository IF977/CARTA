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
    
    def lista
        @list_comp = List.new
        @mostra = Manage.find(params[:id])
        #@qtds = params[:qtds]
        #@total = (params[:qtds]).to_i * (@mostra.price).to_i
        
        @list_comp.qtd = params[:qtds]
        @list_comp.total = (params[:qtds]).to_i * (@mostra.price).to_i
        @list_comp.manage_id = params[:id]
        @list_comp.namep = params[:mesa]
        @list_comp.price = @mostra.price
        @list_comp.save
        
        #@list_comp = List.where(namep: params[:mesa])
         
        busc = params[:mesa]
        sql = "select t1.name, t2.* from Manages t1, Lists t2 where t1.id=t2.manage_id and t2.namep='Vazio'"
        @list_comp = ActiveRecord::Base.connection.execute(sql)
        #@list_comp = List.all(:include => :manage_id)
        #@list_comp = List.where(namep: params[:mesa] and manage_id: @mostra.id)
        #@list_comp = List.joins(:Manage).where((List.namep: params[:mesa]) and (List.manage_id: Manage.id))
    end
    def create
       
    end
    
    def destroy
        #@del = List.all
        @del = List.where(namep: params[:mesa])
        @del.each do |dest|
            dest.destroy
        end
        redirect_to :back
    end
    
    private
        def list_params
            params.require(:list).permit(:namep, :qtd, :price, :total)
        end
    
end

    