class List < ApplicationRecord
  has_many :bookmarks
  has_many :movies, through: :bookmarks

  validates :name, presence: true, uniqueness: true
  before_destroy :destroy_child_movies

  private

  def destroy_child_movies
    movies.destroy_all
  end
end
