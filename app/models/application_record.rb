class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  validates :title, presence: true, length: { maximum: 50 }
  validates :content, presence: true, length: { maximum: 500 }
end
