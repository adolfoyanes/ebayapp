class CreateEbayAuths < ActiveRecord::Migration[5.2]
  def change
    create_table :ebay_auths do |t|
      t.string :user_id
      t.string :access_token
      t.string :refresh_token
      t.datetime :expiration
      t.string :token_type

      t.timestamps
    end
  end
end
