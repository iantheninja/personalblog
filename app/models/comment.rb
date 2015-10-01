class Comment < ActiveRecord::Base
  belongs_to :post
  validates :name, presence: true, length: {minimum: 10}
  validates :body, presence: true
end
