class User < ApplicationRecord
  authenticates_with_sorcery!
  mount_uploader :avatar, AvatarUploader

  has_many :boards, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :bookmarks
  has_many :likes, through: :bookmarks, source: :board
  
  validates :first_name, presence: true, length: { maximum: 255 }
  validates :last_name, presence: true, length: { maximum: 255 }

  validates :password, length: { minimum: 3}, if: -> {new_record? || changes[:crypted_password]}
  validates :password, confirmation: true, if: -> {new_record? || changes[:crypted_password]}
  validates :password_confirmation, presence: true, if: -> {new_record? || changes[:crypted_password]}
  validates :reset_password_token, uniqueness: true, allow_nil: true

  validates :email, presence: true, uniqueness: true
  enum role:{ general:0, admin:1 }

  def own?(object)
    id == object.user_id
  end
  def bookmark?(board)
    board.bookmarks.pluck(:user_id).include?(id)
  end
  def bookmark(board)
    likes << board
  end
  def unbookmark(board)
    likes.destroy(board)
  end

end
