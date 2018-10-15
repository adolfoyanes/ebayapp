json.extract! product, :id, :url, :upc, :current_price, :average_price, :cost, :gross_margin, :net_margin, :roi, :name, :total_sold, :average_sold, :created_at, :updated_at
json.url product_url(product, format: :json)
