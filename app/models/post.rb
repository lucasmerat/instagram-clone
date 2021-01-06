class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  before_create :set_active

  belongs_to :account
  has_many :likes
  has_many :comments

  scope :active, -> { where active: true }

  def set_active
    self.active = true
  end

  def user_liked?(account_id)
    likes.exists?(account_id: account_id)
  end
end
