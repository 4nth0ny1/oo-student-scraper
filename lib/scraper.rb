require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    html = File.read(index_url)
    index_scrape = Nokogiri::HTML(html)

    hashes = {}
    
    index_scrape.css(div.rosters-card-container).each do |hash|
      binding.pry
      # student_card = hash.css(div.student-card).text
      hashes[student_card.to_sym] = {
        :name => hash.css(h4.student-name).text, 
        :location => hash.css(p.student-location).text,
        :profile_url => hash.css(div.student-card a).attribute("src").value
      }
      hashes
    end
  end

  # def self.scrape_profile_page(profile_url)
    
  # end

end

