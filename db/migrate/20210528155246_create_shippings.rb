class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|

      t.string          :postal_code    , nill: false
      t.integer         :prefecture_id  , nill: false
      t.string          :municipality   , nill: false
      t.string          :address        , nill: false
      t.string          :building
      t.string          :phone_number   , nill: false
      t.references      :order          , nill: false, foreign_key: true
      t.timestamps
    end
  end
end
