class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true
  before_save(:titleize_name)
  before_save(:titleize_country_of_origin)

  private
    def titleize_name
      self.name = self.name.titleize
    end

    def titleize_country_of_origin
      self.country_of_origin = self.country_of_origin.titleize
    end
end