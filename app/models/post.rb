class Post < ApplicationRecord
  mount_uploader :image, ImageUploader
  before_create :set_active

  belongs_to :account

  scope :active, -> { where active: true }

  def set_active
    self.active = true
  end
end
