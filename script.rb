require 'nokogiri'
require 'csv'
require 'open-uri'
require 'curb'
require_relative 'data'

class Product
	attr_accessor :name, :cost, :image_url
	def initialize(product_name, cost, image_url)
		@name = product_name
		@cost = cost
		@image_url = image_url
	end
end

puts "Wait a bit please..."

html = Curl.get("https://www.petsonic.com/snacks-huesos-para-perros/")

array = []
doc = Nokogiri::HTML(open(URL))

		puts items_count = doc.xpath("//img[@width='250']/@src").size
		
		product_name = doc.xpath("//a[@class='product-name']/@title").text.strip
		product_cost = doc.xpath("//span[@class='price product-price']").text.strip
		product_image = doc.xpath("//img[@width='250']/@src")
		
		puts "#{product_name}\n#{product_cost}\n#{product_image}\n"

		array.push(Product.new(product_name, product_cost, product_image))

	
CSV.open(FILE_NAME + ".csv", "w") do |csv|
	csv << ["Name", "Price", "Image"]
	for item in array
		csv << [item.name, item.cost, item.image_url]
	end
end

puts "The file is written!"