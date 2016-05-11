class PicturesController < ApplicationController
     before_action :set_manage

  def create
    add_more_pictures(pictures_params[:pictures])
    flash[:error] = "Failed uploading pictures" unless @manage.save
    redirect_to :back
  end

  def destroy
    remove_picture_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting picture" unless @manage.save
    redirect_to :back
  end

  private

  def set_manage
    @manage = Manage.find(params[:manage_id])
  end

  def add_more_pictures(new_pictures)
    pictures = @manage.pictures 
    pictures += new_pictures
    @manage.pictures = pictures
  end

  def remove_picture_at_index(index)
    remain_pictures = @manage.pictures # copy the array
    if remain_pictures.count > 1
      remain_pictures.delete_at(index)
      flash[:notice] = "Imagem deletada com sucesso!"
    else
      flash[:error] = "Você não pode deixar o prato sem imagem!"
    end
    #deleted_picture = remain_pictures.delete_at(index) # delete the target image
    #deleted_picture.try(:delete!) # delete image from S3
    @manage.pictures = remain_pictures  # re-assign back
      
    
  end

  def pictures_params
    params.require(:manage).permit({pictures: []}) # allow nested params as array
  end

end
