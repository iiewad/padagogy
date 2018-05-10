class Post < ApplicationRecord
  require 'carrierwave/orm/activerecord'

  paginates_per 10
  belongs_to :user
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :title, presence: true
  validates :body, presence: true

  mount_uploader :cover, CoverUploader

  enum status: { normal: 0, hot: 1 }

  scope :normal, -> { where(status: 0) }
  scope :hot, -> { where(status: 1) }
end
