class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :full_name
      t.string :mobile
      t.string :member_id
      t.string :comment_details

      t.timestamps
    end
  end
end
