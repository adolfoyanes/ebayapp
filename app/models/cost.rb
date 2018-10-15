class Cost < ApplicationRecord

	def self.import(file)
    CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
    	puts row
    	# cost = Cost.new
    	# cost.brand = row["brand"]
    	# cost.brand = row["category"]
    	# cost.brand = row["modelo"]
    	# cost.brand = row["color"]
    	# cost.brand = row["medida"]
    	# cost.brand = row["upc"]
    	# cost.brand = row["precio_esp"]
    	# cost.save 
      Cost.create! row.to_hash
    end
  end
end
