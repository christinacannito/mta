# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
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

puts "loading"
output.each do |subway_array|
  Service.create(name: subway_array[0], traffic: subway_array[1])
  end
puts "finished loading"


