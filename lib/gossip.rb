require 'csv'
class Gossip
  
  attr_accessor :author, :content, :all_gossips

  def initialize(author, content)
    @author = author
    @content = content
  end

  def save
    CSV.open("/mnt/c/Users/Tomáz/Desktop/Dev/THP/J21/the_gossip_project_sinatra/db/gossip.csv", "ab") do |csv|
      csv << [@author, @content]
    end
  end

  def self.all
    all_gossips = [] 
    CSV.read("/mnt/c/Users/Tomáz/Desktop/Dev/THP/J21/the_gossip_project_sinatra/db/gossip.csv").each do |csv_line|
      all_gossips << Gossip.new(csv_line[0], csv_line[1])
    end
    return all_gossips

  end

  def self.find(id)
    array = Gossip.all
    return [array[id].author,array[id].content]
  end



end