class User < ApplicationRecord
  scope :recent, -> { where('created_at > ?', 1.week.ago) }
  has_many :posts
  validates :name, :email, presence: true

  def profile_photo_url
    "https://s.gravatar.com/avatar/#{Digest::MD5.hexdigest(email)}"
  end
end
