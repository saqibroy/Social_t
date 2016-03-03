class User < ActiveRecord::Base
  has_many :words
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_attached_file :image, styles: { thumb: "200x200>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  has_many :conversations, :foreign_key => :sender_id

  def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |user|
        csv << user.attributes.values_at(*column_names)
      end
    end
  end


  def define_role(type)
  	if type == "Admin"
  		self.add_role :admin
  	else
  		self.add_role :user
  	end
  end
end
