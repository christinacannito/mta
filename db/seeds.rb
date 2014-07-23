require 'open-uri'
require 'nokogiri'
require 'pry'

class ServiceSeeds

  attr_accessor :doc, :status_array, :description, :delay_header, :output_hash

  def initialize
    @output_hash = Hash.new {|hash, key| hash[key] = {}} 
    @doc = Nokogiri::XML(open("http://web.mta.info/status/serviceStatus.txt"))
  end

  def descriptive_status
    @doc.xpath('//subway//line').each do |line|

      train_name = line.at_css("/name").text

      train_status = line.at_css("status").text
      @output_hash[train_name][:status] = train_status 
      super_descriptive = line.xpath("text")

      html = Nokogiri::HTML(super_descriptive.text)

      if train_status == "GOOD SERVICE"
        super_descriptive = "On time"
      else  
        html.css(".plannedWorkDetailLink").each do |detail|
          planned_work = detail.children.text
          @output_hash[train_name][:header] = planned_work
        end

        html.css(".plannedWorkDetail").each do |detail|
          planned_work_detail = detail.children.text
          @output_hash[train_name][:details] = planned_work_detail
        end

        html.css(".TitleDelay").each do |detail| # working with this 
          title_delay = detail.children.text
          @output_hash[train_name][:title_delay] = title_delay
        end

        html.css(".TitleServiceChange").each do |detail|
          title_service_change = detail.children.text
          @output_hash[train_name][:service_change] = title_service_change
        end       
      end 
    end 
    @output_hash
  end
end

 service = ServiceSeeds.new

<<<<<<< HEAD
puts "deleting old Service seeds"
Service.destroy_all
=======
  def output
   @train_name_array.zip(@train_status_array, @train_description)
  end
  
 
puts "deleting old seeds"
Service.delete_all
descriptive_status
puts "loading"
output.each do |subway_array|
<<<<<<< HEAD
  Service.create(name: subway_array[0], traffic: subway_array[1], description: subway_array[2])
  end
=======

  Service.create(name: subway_array[0], traffic: subway_array[1], description: subway_array[2])
  end
puts Service.count
puts "finished loading"
>>>>>>> e6418a40f965b1135ac44f80ad3e6a8ad8cc2f73
>>>>>>> 1867dcf8bd54d2ca3e3344b52aff9592bd4b7491

service.descriptive_status.each do |train_name, info|

  Service.create(name: train_name, traffic: info[:status], description: info[:header], more_detail: info[:details])
end

puts "Updated service information"
