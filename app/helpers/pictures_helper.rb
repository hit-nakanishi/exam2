module PicturesHelper
  def choose_new_or_edit
    if action_name == 'new' || action_name == 'confirm'
      confirm_pictures_path
    elsif action_name == 'edit'
      picture_path
    end
  end

  def picture_img(picture)
    return image_tag(picture.pict) if picture.pict?

    unless picture.pict.blank?
      pict_url = picture.pict
    else
      pict_url = 'no_image_pict.png'
    end
    image_tag(pict_url)
  end
end
