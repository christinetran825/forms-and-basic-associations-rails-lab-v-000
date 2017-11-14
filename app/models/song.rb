class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def genre_name=(name)
    self.genre = Genre.find_or_create_by(name: name)
  end

  def genre_name
    self.genre.name
  end

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    self.artist.name
  end

  def note_contents=(content)
    self.note = Note.find_or_create_by(name: content)
  end

  def genre_ids=(ids)
    ids.each do |id|
      genre = Genre.find(id)
      sel.genres << genre
    end
  end

end
