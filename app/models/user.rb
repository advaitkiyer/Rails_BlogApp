class User < ApplicationRecord
  devise :database_authenticatable, # For database authentication
         :registerable, # For user registration
         :recoverable, # For password recovery
         :rememberable, # For persistent login sessions
         :trackable, # For tracking sign-in statistics
         :validatable # For email and password validations

  before_save :downcase_email

  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }, presence: true, uniqueness: true

  has_many :blogs

  private

  def downcase_email
    self.email = email.downcase
  end
end
