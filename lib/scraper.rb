require 'open-uri'
require 'pry'

class Scraper

  def self.scrape_index_page(index_url)
    site = https://learn-co-curriculum.github.io/student-scraper-test-page/index.html
    
    page = Nokogiri::HTML(open(site))
    
    name = page.css"a.card-text-container h4"
    
    location = page.css"a.card-text-container p"
    
    profile_url = "a.view-profile-div h3"
    
    student = {name: name, location: location, profile_url: profile_url}
    array = [] 
    array.push(student)
  end

  def self.scrape_profile_page(profile_url)
    site = https://learn-co-curriculum.github.io/student-scraper-test-page/
    
    page = Nokogiri::HTML(open(site))
    
    
  end

end

