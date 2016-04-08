class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy

  has_attached_file :image, styles: { medium: "400x400>" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/ #makes sure an image is uploaded

  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true
end
