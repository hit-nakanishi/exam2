class PicturesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_picture, only: [:edit, :update, :destroy]

  def index
    @pictures = Picture.all.order(id: :desc)

  end

  def new
    if params[:back]
      @picture = Picture.new(pictures_params)
      set_user
    else
      @picture = Picture.new
      set_user
    end
  end
  
  def create
    @picture = Picture.new(pictures_params)
    set_user

    if @picture.save
      redirect_to pictures_path, notice: "写真を投稿しました！"
      NoticeMailer.sendmail_picture(@picture).deliver
    else
      render action: 'new'
    end
  end

  def edit
  end

  def update
    set_user
    if @picture.update(pictures_params)
     redirect_to pictures_path, notice: "投稿を更新しました！"
    else
      render action: 'edit'
    end
  end

  def destroy
    @picture.destroy
    redirect_to pictures_path, notice: "投稿を削除しました！"
  end
  
  def confirm
    @picture = Picture.new(pictures_params)
    set_user
    render :new if @picture.invalid?
  end

  private
    def pictures_params
      params.require(:picture).permit(:title, :content, :pict2, :pict2_cache, :user_id)
    end
    
    # idをキーとして値を取得するメソッド
    def set_picture
      @picture= Picture.find(params[:id])
    end

    # user_idを代入する
    def set_user
      @picture.user_id = current_user.id
    end
end
