class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    validates :name, presence: true

    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  
    has_many :projects, dependent: :destroy
  
    def self.ransackable_attributes(auth_object = nil)
      super + %w[created_at email id remember_created_at reset_password_sent_at reset_password_token updated_at name]
    end
  end