class Picture < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  validates :pict2, presence: true

  belongs_to :user

  mount_uploader :pict2, PictUploader

end
