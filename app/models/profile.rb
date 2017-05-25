class Profile < ApplicationRecord
  belongs_to :user
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  def self.search(search)
  where("tutor ILIKE ? OR teaching ILIKE ? OR learning ILIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
  end
end
