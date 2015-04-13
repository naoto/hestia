require 'nokogiri'
require 'open-uri'

class AnimeList

  attr_reader :pattern

  def initialize
    @pattern = /^(anime\/list)/
    @url = "http://tv.yahoo.co.jp/tv_show/anime/"
  end

  def scrap(args = nil)
    anime = []
    Nokogiri::XML(open(@url).read).at("div.cont.all_list").search("li").each do |li|
      dt = li.at("dt")
      next if dt.nil?
      title = dt.content
      on_air = []
      if li.at("dl").content =~ /(.曜)(\d{2}:\d{2})/
        on_air = [$1, $2]
      end
      anime << { title: title, onair: on_air }
    end
    anime
  end

end
