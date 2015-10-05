require 'nokogiri'
require 'open-uri'

class AnimeList

  attr_reader :pattern

  def initialize
    @pattern = /^(anime\/list)/
    @url = "http://www.kansou.me"
  end

  def scrap(args = nil)
    anime = []
    Nokogiri::XML(open(@url).read).at("table.list").search("tr").each do |li|
      td = li.search("td")
      next if td.nil? or td.empty?
      title = td[1].content
      date = td[0].content
      time = td[2].content
      on_air = []
      week = date.scan(/\(.*\)/).first
      if !week.nil?
        on_air << "#{week.gsub(/(\(|\))/, '')}曜"
      end
      timelist = []
      time.each_line do |t|
        if t.strip.include?(date.strip.gsub(/^\d+\//,''))
          timelist << t.scan(/\d{2}:\d{2}/).first
        end
      end
      time = timelist.sort.first
      if !time.nil?
        on_air << time
      end
      anime << { title: title, onair: on_air }
    end
    anime
  end

end
