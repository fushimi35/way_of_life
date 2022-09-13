class Board < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :bookmarks, dependent: :destroy
  has_many :likes, through: :bookmarks, source: :user
  
  mount_uploader :board_image, BoardImageUploader
  validates :title, presence: true, length: { maximum: 255 }
  validates :body, length: { maximum: 65_535 }
  enum topic: {work_hobby: 0, couldnt_find: 1, not_talented: 2, success_big_company: 3, overcome_parent: 4, not_like: 5, easy_work_life: 6, not_experienced: 7, other: 8}
end
