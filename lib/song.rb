require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.all
    @@all
  end

  def self.create 
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name (name)
      song = self.new
      song.name= name
      song
  end

  def self.create_by_name(name)
      song = self.new_by_name(name)
      @@all << song
      song
  end

  def self.find_by_name (name)
      @@all.find{|song| song.name == name}
  end

  def self.find_or_create_by_name (name)
      self.find_by_name(name) ? self.find_by_name(name) : self.create_by_name(name)
  end

  def self.alphabetical 
      self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename (file)
      file_name_parts = file.split(" - ")
      artist_name= file_name_parts[0]
      name = file_name_parts[1].scan(/\b.*\./)[0][0..-2]

      song = self.find_or_create_by_name (name)
      song.artist_name= artist_name

      song
  end

  def self.create_from_filename (file)
      self.new_from_filename(file)
  end

  def self.destroy_all 
    @@all = []
  end
  def save
    self.class.all << self
  end

end
