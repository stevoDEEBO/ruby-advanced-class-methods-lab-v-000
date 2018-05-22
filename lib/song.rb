class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    @@all << song
    song
  end

  def self.find_by_name(name)
    self.all.detect{|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name) == nil
      self.create_by_name(name)
      #puts "added new song."
    else
      self.find_by_name(name)
      #puts "found it!"
    end
  end

  def self.alphabetical
    self.all.sort_by{ |i| i.name }
  end

  def self.new_from_filename(artist_name_and_name)
    artist_name_s = artist_name_and_name.split(/\ - |\./)[0]
    name_s = artist_name_and_name.split(/\ - |\./)[1]
    song = self.new
    song.name = name_s
    song.artist_name = artist_name_s
    song
  end

  def self.create_from_filename(artist_name_and_name)
    new_song = self.new_from_filename(artist_name_and_name)
    @@all << new_song
    new_song
  end

  def self.destroy_all
    @@all.clear
  end
end
