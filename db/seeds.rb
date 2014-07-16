require 'open-uri'
require 'nokogiri'
    @train_name_array=[]
    @train_status_array=[]
    # @train_headline=[]
    # @train_details=[]
    
    @doc = Nokogiri::XML(open("http://web.mta.info/status/serviceStatus.txt"))
 
  def descriptive_status
    @doc.xpath('//subway//line').each do |line|
      
      train_name = line.at_css("/name").text
      @train_name_array << train_name
      train_status = line.at_css("status").text
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
    end 
  end


  def output
   @train_name_array.zip(@train_status_array)
  end
<<<<<<< HEAD

=======
  
 
>>>>>>> ac10c6742c7f3215ec7ee2b401b8b248f1309be1
puts "deleting old seeds"
descriptive_status
Service.delete_all
puts "loading"
output.each do |subway_array|
<<<<<<< HEAD

  Service.create(name: subway_array[0], traffic: subway_array[1])
  end
puts Service.count
puts "finished loading"
=======
  Service.create(name: subway_array[0], traffic: subway_array[1], description: subway_array[2])
  end
>>>>>>> ac10c6742c7f3215ec7ee2b401b8b248f1309be1

puts "finished loading"

    
  
 
  
