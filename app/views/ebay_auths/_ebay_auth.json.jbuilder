json.extract! ebay_auth, :id, :user_id, :access_token, :refresh_token, :expiration, :token_type, :created_at, :updated_at
json.url ebay_auth_url(ebay_auth, format: :json)
