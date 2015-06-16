class Product < ActiveRecord::Base
  belongs_to :category
  belongs_to :user
  has_many :reviews

  validates :title, :description, :price, :user, presence: true
  validates :price, format: {with: /\A\d+(\.\d{0,2})?\z/}

  def average_rating
    reviews.collect(&:rating).inject(&:+).to_f / reviews.count
  end

  def can_edit? user
    self.user.eql? user
  end
end
