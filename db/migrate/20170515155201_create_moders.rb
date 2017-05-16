class CreateModers < ActiveRecord::Migration
  def change
    create_table :moders do |t|

      t.timestamps null: false
    end
  end
end
