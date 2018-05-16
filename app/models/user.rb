class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :set_default

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :blog_posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :jobs

  validates :username, presence: true, uniqueness: true

  mount_uploader :avatar, AvatarUploader

  def set_default
    if self.role == nil || self.role == ""
      self.role = "client"
    end
  end

  def admin?
   role == "admin"
  end

  def manager?
   role == "manager"
  end

  def worker?
   role == "worker"
  end

end
