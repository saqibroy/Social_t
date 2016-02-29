class User < ActiveRecord::Base
  has_many :words
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :image, styles: { thumb: "200x200>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
end
