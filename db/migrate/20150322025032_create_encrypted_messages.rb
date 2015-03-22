class CreateEncryptedMessages < ActiveRecord::Migration
  def change
    create_table :encrypted_messages do |t|
      t.string :email
      t.string :msg

      t.timestamps null: false
    end
  end
end
