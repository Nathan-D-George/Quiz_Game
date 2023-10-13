class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  
  has_one_attached :photo

  has_many :scores

  enum role:       %i[player ADMIN]
  enum difficulty: %i[easy medium hard]

  after_commit :add_default_avatar, on: %i[create update]

  def photo_thumbnail
    photo.variant(resize_to_limit: [150, 150]).processed
  end

  def game_photo
    photo.variant(resize_to_limit: [70, 70]).processed
  end

  private

  def add_default_avatar
    return if photo.attached?

    photo.attach(
      io: File.open(Rails.root.join('app','assets','images','default.avif')),
      filename: 'default.avif',
      content_type: 'image/avif'
    )
  end
end
