class Track < ApplicationRecord
  validates :name, :album_id, :ord, :bonus, presence: true
  validates :name, uniqueness: {scope: :album_id}

  belongs_to :album,
    primary_key: :id,
    foreign_key: :album_id,
    class_name: :Album

  belongs_to :band,
    through: :album,
    source: :band
end
