class CreateAttendances < ActiveRecord::Migration[5.2]
  def change
    create_table :attendances do |t|
      t.string :strip_customer_id

      t.timestamps

      t.belongs_to :user
      t.belongs_to :event
    end
  end
end
