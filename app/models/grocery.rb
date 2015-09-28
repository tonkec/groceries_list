class Grocery < ActiveRecord::Base
  validates :title,  presence: true, length: { maximum: 50 }
  validates :description, length: { maximum: 250 }
  validates :user_id, presence: true
  belongs_to :user
  default_scope -> { order('created_at DESC') }
end
