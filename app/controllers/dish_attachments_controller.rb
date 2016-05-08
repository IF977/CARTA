class DishAttachmentsController < ApplicationController
  before_action :set_dish_attachment, only: [:show, :edit, :update, :destroy]

  # GET /dish_attachments
  # GET /dish_attachments.json
  def index
    @dish_attachments = DishAttachment.all
  end

  # GET /dish_attachments/1
  # GET /dish_attachments/1.json
  def show
  end

  # GET /dish_attachments/new
  def new
    @dish_attachment = DishAttachment.new
  end

  # GET /dish_attachments/1/edit
  def edit
  end

  # POST /dish_attachments
  # POST /dish_attachments.json
  def create
    @dish_attachment = DishAttachment.new(dish_attachment_params)

    respond_to do |format|
      if @dish_attachment.save
        format.html { redirect_to @dish_attachment, notice: 'Dish attachment was successfully created.' }
        format.json { render :show, status: :created, location: @dish_attachment }
      else
        format.html { render :new }
        format.json { render json: @dish_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dish_attachments/1
  # PATCH/PUT /dish_attachments/1.json


def update
  respond_to do |format|
    if @dish_attachment.update(dish_attachment_params)
      format.html { redirect_to @dish_attachment.dish, notice: 'Dish attachment was successfully updated.' }
    end 
  end
end

  # DELETE /dish_attachments/1
  # DELETE /dish_attachments/1.json
  def destroy
    @dish_attachment.destroy
    respond_to do |format|
      format.html { redirect_to dish_attachments_url, notice: 'Dish attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_dish_attachment
      @dish_attachment = DishAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dish_attachment_params
      params.require(:dish_attachment).permit(:dish_id, :image, {images: []})
    end
end
