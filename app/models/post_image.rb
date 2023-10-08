class PostImage < ApplicationRecord

  has_one_attached :image
  belongs_to :user

  validates :shop_name, presence: true
  validates :image, presence: true

  def get_image
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/IMG_0819.jpeg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [150, 150]).processed
  end
end
