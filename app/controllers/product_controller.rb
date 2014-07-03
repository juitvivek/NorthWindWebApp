class ProductController < ApplicationController
  def controller
  end
  def product
				# This programs demonstrates how Ruby may be used to parse JSON strings.
				# Ruby represents the JSON object as a hash.
				require 'net/http'
				require 'json'
				# Go out to the internet and collect some JSON
				# Set up the URL
				url = "http://services.odata.org/Northwind/Northwind.svc/Products?$format=json"
				# Make an HTTP request and place the result in jsonStr
				jsonStr = Net::HTTP.get_response(URI.parse(url))
				data = jsonStr.body
				jsonHash = JSON.parse(data)
				op1 = params[:product][:op1].to_i
				input=(op1).to_i - 1
				@productid=jsonHash["value"][input]["ProductID"].to_s
				@name=jsonHash["value"][input]["ProductName"].to_s
				@supplier=jsonHash["value"][input]["SupplierID"].to_s
				# See if the product is discontinued or Active
				if (jsonHash["Discontinued"]) 
					  print "It is Discontinued"
				   else 
					  print "It is Active"   
  end
  end
  end