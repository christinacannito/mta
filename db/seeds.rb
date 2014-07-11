require 'open-uri'
require 'nokogiri'
    @train_name_array=[]
    @train_status_array=[]
    @train_description=[]
    
    @doc = Nokogiri::XML(open("http://web.mta.info/status/serviceStatus.txt"))
    
def subway_list
      @doc.xpath("//name").collect do |lines|
        lines = lines.text
        @lines = lines
      end
end
 
 
  def descriptive_status
    @doc.xpath('//subway//line').each do |line|
      
      train_name = line.at_css("/name").text
      @train_name_array << train_name
      train_status = line.at_css("status").text
      @train_status_array << train_status
      descriptive_status = line.xpath("text")
      
      html = Nokogiri::HTML(descriptive_status.text)
      
      html.css(".plannedWorkDetailLink").each do |detail|
        planned_work_detail_link = detail.children.text
        @train_description << planned_work_detail_link
      end
 
      html.css(".plannedWorkDetail").each do |detail|
        planned_work_detail = detail.children.text
        @train_description << planned_work_detail
      end
 
      if train_status == "GOOD SERVICE"
        @train_description << "Hooray! Good train service today!"
      else 
        status_text = descriptive_status.text
        cleaned_status = status_text.scan(/<br\/><br\/>(.+)<br\/><br\/>/m) # slightly working 
        
        new_clean_status = cleaned_status.flatten
 
        new_clean_status.each do |line_info|
          puts line_info.gsub(/<(\/)*(\w)+(\s)*(\/)*>/m, "")
        end 
      end 
    end 
  end


  def output
   @train_name_array.zip(@train_status_array, @train_description)
  end

#Before it seeds, it deletes all previous seeds
puts "deleting old seeds"
Service.delete_all
descriptive_status
puts "loading"
output.each do |subway_array|

  Service.create(name: subway_array[0], traffic: subway_array[1], description: subway_array[2])
  end
puts Service.count
puts "finished loading"


