require 'open-uri'
require 'nokogiri'
require 'pry'

class ServiceSeeds

  attr_accessor :doc, :status_array, :description, :delay_header, :output_hash

  def initialize
    @output_hash = Hash.new {|hash, key| hash[key] = {}} 
    @doc = Nokogiri::XML(open("http://web.mta.info/status/serviceStatus.txt"))
  end

    @train_name_array=[]
    @train_status_array=[]
    # @train_headline=[]
    # @train_details=[]
    
    @doc = Nokogiri::XML(open("http://web.mta.info/status/serviceStatus.txt"))
 

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
      @train_status_array << train_status
    #   descriptive_status = line.xpath("text")
    #   #this is the object with both headline/details
    #   html = Nokogiri::HTML(descriptive_status.text)
     
    #   if train_status == "GOOD SERVICE"
    #     @train_headline << "Hooray! Good train service today!"
    #     @trail_details << "Relax"
    #   else
    #     html.css(".plannedWorkDetailLink").each do |detail|
    #       planned_work_detail_link = detail.children.text
    #       @train_headline << planned_work_detail_link
    #     end    
    #     html.css(".TitleServiceChange").each do |detail|
    #       descriptive_detail = detail.children.text
    #       @train_details << descriptive_detail
    #     end

    #     html.css(".TitleDelay").each do |detail|
    #       descriptive_detail = detail.children.text
    #       @train_details << descriptive_detail
    #     end

    #     html.css('.TitlePlannedWork').each do |detail|
    #       descriptive_detail = detail.children.text
    #       @train_details << descriptive_detail
    #     end
   
    #     html.css(".plannedWorkDetail").each do |detail|
    #       planned_work_detail = detail.children.text
    #       @train_details << planned_work_detail
    #   end 
    # end


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

puts "deleting old Service seeds"
Service.destroy_all
service.descriptive_status.each do |train_name, info|
  Service.create(name: train_name, traffic: info[:status], description: info[:header], more_detail: info[:details])
end

puts "Updated service information"
