class Grocery < ActiveRecord::Base
  validates :title,  presence: true, length: { maximum: 50 }
  validates :description,  presence: true, length: { maximum: 250 }
  belongs_to :user
  default_scope -> { order('created_at DESC') }
end
