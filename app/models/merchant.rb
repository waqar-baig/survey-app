class Merchant < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :customers
  has_many :feedback_forms

  def self.from_omniauth(auth)
    create! do |merchant|
      merchant.provider = auth['provider']
      merchant.uid = auth['uid']
      if auth['info']
         merchant.name = auth['info']['name'] || ""
         merchant.email = auth['info']['email'] || ""
      end
      merchant.password = Devise.friendly_token[0, 20]
    end
  end
end
