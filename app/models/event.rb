class Event < ApplicationRecord
  validates :name, :location, presence: true

  validates :description, length: {minimum: 25}

  validates :price, numericality: {only_integer: false, greater_than: -0.01}

  validates :image_file_name, allow_blank: true, format:{
    with:  /\w+\.(gif|jpg|png)\z/i,
    message: "must reference a GIF, JPG, or PNG image"
  }
  def free?
    price.blank? || price.zero?
  end
  def self.upcoming
     where("starts_at >= ?", Time.now).order("starts_at")
  end
  def self.previous
    where("starts_at <= ?", Time.now).order("starts_at")
 end
end
