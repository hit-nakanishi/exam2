class Picture < ActiveRecord::Base
  validates :title, presence: true
  validates :content, presence: true
  validates :pict, presence: true

  belongs_to :user

end
