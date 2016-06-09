  class Post < ActiveRecord::Base
  has_many  :taggings, dependent: :destroy
  has_many :tags, through: :taggings, dependent: :destroy
  belongs_to :admin
  has_attached_file :image, styles: { medium: "400x400>" }
  validates_attachment :image,
                     content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] } #makes sure it is an image

  validates :title, presence: true, length: {minimum: 5}
  validates :body, presence: true

  def all_tags=(names)
    self.tags = names.split(",").map do |name|
      Tag.where(name: name.strip).first_or_create!
    end
  end

  def all_tags
    self.tags.map(&:name).join(", ")
  end

  def checkusername(post)
    self.admin = Admin.find(post.admin_id)
    return admin.username
  end
end
