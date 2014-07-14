require 'open-uri'
require 'nokogiri'
    @lines = []
    @status = []
    @doc = Nokogiri::XML(open("http://web.mta.info/status/serviceStatus.txt"))

  def subway_list
      @doc.xpath("//name").collect do |lines|
        lines = lines.text
        @lines = lines
      end
  end

  def service_list
    @doc.xpath("//status").collect do |status|
       status = status.text
       @status = status
    end
  end

  def output
   subway_list.zip(service_list)[0..9]
  end
  
 
puts "deleting old seeds"
Service.delete_all
puts "loading"

output.each do |subway_array|
  Service.create(name: subway_array[0], traffic: subway_array[1], description: subway_array[2])
  end

puts "finished loading"

    
  
 
  