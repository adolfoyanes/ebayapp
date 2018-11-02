class Cost < ApplicationRecord

	def self.import(file)
    CSV.foreach(file.path, headers: true, encoding:'iso-8859-1:utf-8') do |row|
    	puts row
    	cost = Cost.new
    	cost.brand = row["brand"]
    	cost.category = row["category"]
    	cost.modelo = row["modelo"]
    	cost.color = row["color"]
    	cost.medida = row["medida"]
    	cost.upc = row["upc"]
    	cost.precio_esp = row["precio_esp"]
        cost.frame_color = row["frame_color"]
    	cost.save 
      # Cost.create! row.to_hash
    end
  end
end
