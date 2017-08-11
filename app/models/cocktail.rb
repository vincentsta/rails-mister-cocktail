class Cocktail < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  has_many :doses, dependent: :destroy
  has_many :ingredients, through: :doses
  mount_uploader :photo, PhotoUploader

  def <=>(other)
    (other.votes.to_i || 0) <=> (self.votes.to_i || 0)
  end

end
