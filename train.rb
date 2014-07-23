
# require 'rest-client'    
# require 'nokogiri'    
# require 'pry'    



# class Train
# 	def  initialize
# 		@all_trains_data =[]
# 		@res = RestClient.get('http://web.mta.info/status/serviceStatus.txt')    
# 		@doc = Nokogiri::XML(@res)  
# 		@name_array=[]
# 		@status_array=[]
# 		@head_description_array=[]
# 		@description_details_array = []
# 	end 


# 		def info
# 			@doc.xpath('//subway//line').each do |line|

# 				name = line.xpath('name').text
# 				@name_array << name 
# 				status = line.xpath('status').text     
# 				@status_array << status
# 			end
# 		end
			   

# 		def descriptive_method
# 			@doc.xpath('//subway//line').each do |line|
# 			html = Nokogiri::HTML(line.xpath('text').text)
			
# 			@status_array.each do |block|
# 				if block == "GOOD SERVICE"
# 					@head_description_array << "Have a Nice Day"
# 					@description_details_array << "It's all good"
# 				else 
# 					@head_description_array << html.css('.plannedWorkDetailLink').text
# 					pwd=html.css('.plannedWorkDetail').text unless nil
# 					tsc=html.css('.TitleServiceChange').text unless nil
# 					tpw=html.css('.TitlePlannedWork').text nil 
# 					crap=[pwd,tsc,tpw]
# 					crappy_string=[]			
# 					crap.each {|object|
# 						if object.is_a?(String)
							
# 					} 
					

# 					@description_details_array << 
				
# 				end
# 			end	

# 			end	
# 		end




# 			   html = Nokogiri::HTML(line.xpath('text').text)
# 			   if status== "GOOD SERVICE"
# 			   	@head_description_array << "Have a Nice Day"
# 			   	@description_details_array << "It's all good"
# 			   else 
# 					@head_description_array << html.css('.plannedWorkDetailLink').text
						
# 					pwd=html.css('.plannedWorkDetail').text
# 					tsc=html.css('.TitleServiceChange').text
# 					tpw=html.css('.TitlePlannedWork').text
# 					@description_details_array << (pwd+tsc+tpw)

# 					binding.pry
# 				end
# 			end
# 		end

# end

# train = Train.new
# train.info