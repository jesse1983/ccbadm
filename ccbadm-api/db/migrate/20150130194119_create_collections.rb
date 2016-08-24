class CreateCollections < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.references :tax, index: true
      t.decimal :property_price, :precision => 10, :scale => 2
      t.decimal :trash_price, :precision => 10, :scale => 2
      t.decimal :casualty_price, :precision => 10, :scale => 2
      t.integer :period, index: true
      t.datetime :expire_date
      t.decimal :payment_price, :precision => 10, :scale => 2
      t.datetime :payment_date
      t.boolean :paid, default: false
      t.decimal :paid_price, :precision => 10, :scale => 2
      t.string :reason_non_payment
      t.decimal :credit_price, :precision => 10, :scale => 2
      t.datetime :credit_date
      t.decimal :actual_debt, :precision => 10, :scale => 2
      t.decimal :active_debt, :precision => 10, :scale => 2
      t.decimal :legal_debt, :precision => 10, :scale => 2
      t.decimal :suspended_debt, :precision => 10, :scale => 2
      t.decimal :divided_debt, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
