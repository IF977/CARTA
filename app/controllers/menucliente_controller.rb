class MenuclienteController < ApplicationController
    
    before_action :procprat, only: [:pratos, :pratoscar]
    before_action :mesa_escolhida
    $seq_ped = 0
    
    def select_mesa
        @mesa_esc = MesasTemp.new
        @mesa_esc.mesa = params[:mesa]
        
        if @mesa_esc.mesa == ""
            respond_to do |format|
                format.html { redirect_to selecmesa_menucliente_index_path, notice: 'Escolha uma mesa para continuar.' }
                format.json { head :no_content }
            end

        else
            if @mesa_esc.save
                respond_to do |format|
                    format.html { redirect_to cardapio_menucliente_index_path, notice: 'Mesa escolhida com sucesso.' }
                    format.json { head :no_content }
                end
            end
        end
    end
    
    def pratos
    end
    
    def pratoscar
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
        @list_comp.total = (params[:qtds]).to_i * (@mostra.price).to_f
        @list_comp.manage_id = params[:id]
        @list_comp.namep = @mostra.name
        @list_comp.price = @mostra.price
        @list_comp.mesa_n = @mesa_name.mesa
        @list_comp.save

        redirect_to lista_menucliente_path
    end
    
    def lista
        @list_compx = List.where(mesa_n: @mesa_name.mesa)
    end
    
    def limplista
        @list_compx = List.where(mesa_n: @mesa_name.mesa)
        @list_compx.each do |x|
            x.destroy
        end
        redirect_to lista_menucliente_path
    end
    
    def destroy
        @del = List.find(params[:id])
        @del.destroy
        respond_to do |format|
            format.html { redirect_to lista_menucliente_path, notice: 'Item deletado com sucesso.' }
            format.json { head :no_content }
        end
    end
    
    def apaga_ped
        
        @del = OrderListDef.find(params[:id])
        @tempo = ((@del.created_at + 1800)-(Time.now))/60
        if @tempo > 27
            @del.destroy
            respond_to do |format|
                format.html { redirect_to pedidos_menucliente_index_path, notice: 'Pedido cancelado!' }
                format.json { head :no_content }
            end
        else
            respond_to do |format|
                format.html { redirect_to pedidos_menucliente_index_path, alert: 'O pedido não pôde ser cancelado pois já se passaram 3 minutos de sua realização. Chame o garçom para solicitar o cancelamento.' }
                format.json { head :no_content }
            end
        end
    end
    
    def apaga_ped_f
        
        @del = OrderListDef.find(params[:id])
        @del.destroy
        
        respond_to do |format|
                format.html { redirect_to pedidosf_path, notice: 'Pedido finalizado com sucesso.' }
                format.json { head :no_content }
            end
        
        #redirect_to pedidosf_path
       
    end
    
    def pedid_save
            @soma = 0
            @list_price = List.where(mesa_n: @mesa_name.mesa)
            @list_price.each do |k|
                @soma += (k.total).to_f
            end
            if @soma > 0
                @ped = Order.new
                @ped.n_order = (((Time.now)-10800).strftime("%Y%m")).to_i * 10000 + $seq_ped
                $seq_ped += 1
                @ped.n_table = @mesa_name.mesa
                @ped.price = @soma
                
                @list_price.each do |tk|
                    @List_order = OrderListDef.new
                    @List_order.namep = tk.namep
                    @List_order.qtd = tk.qtd
                    @List_order.prato_price = tk.price
                    @List_order.total = tk.total
                    @List_order.manage_id = tk.id
                    @List_order.mesa_n = @ped.n_table
                    @List_order.n_order = @ped.n_order
                    @List_order.pedido_total_price = @ped.price
                    @List_order.status = 1
                    @List_order.save
                end
                @ped.save
                @list_price.each do |k|
                    k.destroy
                end
            
                respond_to do |format|
                    format.html { redirect_to pedidos_menucliente_index_path, notice: "Pedido #{@List_order.n_order} Realizado com Sucesso!! Tempo estimado de 30 minutos" }
                    format.json { head :no_content }
                end
            else
                respond_to do |format|
                    format.html { redirect_to lista_menucliente_path, alert: 'Pedido não realizado, pois nenhum prato foi escolhido!' }
                    format.json { head :no_content }
                end
            end
    end
    
    def pedidos
        @lista_ped = OrderListDef.where(mesa_n: @mesa_name.mesa)
    end
    
    def conta
        #@lista_ped = OrderListDef.where(mesa_n: @mesa_name.mesa)
        @lista_ped = OrderListDef.find_by_sql(["SELECT * FROM order_list_defs WHERE mesa_n = ? AND status = ?", @mesa_name.mesa, 1])
        #@lista_ped = OrderListDef.find(:all, :conditions => { :mesa_n => [@mesa_name.mesa] and :status => [1] })
    end
    # codigos chamado garçom
    # 01 => Duvidas diversas
    # 02 => Cancelameto de pedidos
    # 03 => Pagamentos
    
    def chama_garcom
        @c_garcom = Chamagarcom.new
        @c_garcom.mesa_num = @mesa_name.mesa
        @c_garcom.cod_chamado = 01
        @c_garcom.status = "Pendente"
        @c_garcom.save
        respond_to do |format|
                format.html { redirect_to cardapio_menucliente_index_path, notice: 'Em breve o garçom comparecerá para ajuda-lo!' }
                format.json { head :no_content }
        end
        
    end
    
    def chama_garcom2
        @c_garcom = Chamagarcom.new
        @c_garcom.mesa_num = @mesa_name.mesa
        @c_garcom.cod_chamado = 02
        @c_garcom.status = "Pendente"
        @c_garcom.save
        
        respond_to do |format|
                format.html { redirect_to pedidos_menucliente_index_path, notice: 'Em breve o garçom comparecerá para ajuda-lo!' }
                format.json { head :no_content }
        end
        
    end
    
    def chama_garcom3
        @c_garcom = Chamagarcom.new
        @c_garcom.mesa_num = @mesa_name.mesa
        @c_garcom.cod_chamado = 03
        @c_garcom.status = "Pendente"
        @c_garcom.save
        
        respond_to do |format|
                format.html { redirect_to conta_menucliente_index_path, notice: 'Em breve o garçom comparecerá para ajuda-lo!' }
                format.json { head :no_content }
        end
        
    end
    
    private
        def mesa_escolhida
            @mesa_name = MesasTemp.last
        end
    
        def procprat
            @escolha_ped = Manage.all
        end
        
        def list_params
            params.require(:list).permit(:id, :namep, :qtd, :price, :total)
        end
        
        def chamagarcom_params
            params.require(:chamagarcoms).permit(:mesa_num, :cod_chamado, :status)
        end
    
end

