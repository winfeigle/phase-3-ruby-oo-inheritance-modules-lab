require 'pry'

class Artist
  extend Memorable::ClassMethods
  include Memorable::InstanceMethods
  
  extend Findable::ClassMethods
  include Paramable::InstanceMethods

  attr_accessor :name
  attr_reader :songs

  @@artists = []

  def initialize
    # super is used to automatically initialize the method that was written in Memorable::InstanceMethods
    super
    @songs = []
  end

  def self.all
    @@artists
  end

  def add_song(song)
    @songs << song
    song.artist = self
  end

  def add_songs(songs)
    songs.each { |song| add_song(song) }
  end
end
