class Favour < ApplicationRecord
  belongs_to :user
  has_many :comments, dependent: :destroy
  validates :user_id, presence: true
  validates :title, presence: true
  validates :deadline, presence: true
  reverse_geocoded_by :latitude, :longitude
  after_validation :reverse_geocode  # auto-fetch address
  geocoded_by :address
  after_validation :geocode,
                   :if => lambda{ |obj| !obj.address.nil? }

  def send_comment_notification_email
      FavourMailer.comment_notification(self).deliver_now
  end

  def send_creator_comment_notification_email(email)
    FavourMailer.creator_comment_notification(self, email).deliver_now
  end
end
