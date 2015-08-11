class CreateLeads < ActiveRecord::Migration
  def change
    create_table :leads do |t|
      t.string :name, :email
      t.integer :phone_number
      t.string :website, :company, :company_type
      t.integer :user_id
    end
  end
end
