# app/models/user.rb
class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :database_authenticatable, :registerable,
  #        :recoverable, :rememberable, :validatable
  #        :token_authenticatable

  devise :database_authenticatable, :registerable, :recoverable, :rememberable,
         :validatable, :token_authenticatable

  belongs_to :client, optional: true

  has_many :authentication_tokens, dependent: :destroy
end
