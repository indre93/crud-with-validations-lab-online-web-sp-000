class Song < ApplicationRecord
  validates_presence_of :title, :artist_name
  validates_uniqueness_of :title, scope: [:artist_name, :release_year]
  validates_inclusion_of :released, in: [true, false]
  validates_presence_of :release_year, if: :released
  validate :valid_release_date?

  def valid_release_date?
    if release_year.present? && release_year > Date.today.year
      errors[:release_year] << 'Release date cannot be in the future'
    end
  end

end
