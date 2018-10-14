class CreateDeviceConfigs < ActiveRecord::Migration[5.2]
  def change
    create_table :device_configs do |t|
      t.string :auth_key
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
