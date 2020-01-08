require 'open-uri'
require 'pry'

class Scraper


  def self.scrape_index_page(index_url)
    site = https://learn-co-curriculum.github.io/student-scraper-test-page/
    
    page = Nokogiri::HTML(open(site))
    
    name = page.css"a.card-text-container h4"
    
    location = page.css"a.card-text-container p"
    
    profile_url = page.css"a.view-profile-div h3"
    
    student = {name: name, location: location, profile_url: profile_url}
    array = [] 
    array.push(student)
  end

  def self.scrape_profile_page(profile_url)
    page = Nokogiri::HTML(open(profile_url))
      student = {}
      
      container = page.css(".social-icon-container a").collect{|icon| icon.attribute("href").value}
      container.each do |link|
        if link.include?("twitter")
          student[:twitter] = link
        elsif link.include?("linkedin")
          student[:linkedin] = link
        elsif link.include?("github")
          student[:github] = link
        elsif link.include?(".com")
          student[:blog] = link
        end
      end
      student[:profile_quote] = page.css(".profile-quote").text
      student[:bio] = page.css("div.description-holder p").text
      student
    
  end

end

