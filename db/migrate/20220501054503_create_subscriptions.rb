class CreateSubscriptions < ActiveRecord::Migration[6.1]
  def change
    create_table :subscriptions, id: :string do |t|
      t.string :name, null: false
      t.integer :price, null: false
      t.string :description
      t.datetime :payment_date, null: false
      t.column :payment_interval_status, :enum, :limit => %w[month year], null: false
      t.string :cancel_page_link
      t.boolean :notified, default: false
      t.boolean :disabled, default: false
      t.references :user, type: :string, null: false, foreign_key: true

      t.timestamps
    end
  end
end
