class User < ApplicationRecord
  authenticates_with_sorcery!

  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }

  validates :password, length: { minimum: 3}, if: -> {new_record? || changes[:crypted_password]}
  validates :password, confirmation: true, if: -> {new_record? || changes[:crypted_password]}
  validates :password_confirmation, presence: true, if: -> {new_record? || changes[:crypted_password]}

  validates :email, presence: true, uniqueness: true

  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  def own?(object)
    id == object.user_id
  end

  # def change_email(email_after)
  #   email = email_after
  # end

  # def public_method
  #   self.private_method = "something"
  # end

  # private

  # def private_method=(something)
  #   @something = something
  # end
end
