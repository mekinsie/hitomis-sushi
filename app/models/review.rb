class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content_body, presence: true, length: {in: 50...250}
  validates :rating, presence: true, numericality: {  only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :email, presence: true
  before_save(:titleize_author)
  private
    def titleize_author
      self.author = self.author.titleize
    end
end

