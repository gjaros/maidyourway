class BlogPost < ApplicationRecord

  has_many :comments, dependent: :destroy
  belongs_to :user, dependent: :destroy

  validates :title, :blog, presence: true
  validates :title, uniqueness: true, length: { maximum: 140 }
  validates :blog_pic, presence: true

  mount_uploader :blog_pic, BlogPicUploader

end
