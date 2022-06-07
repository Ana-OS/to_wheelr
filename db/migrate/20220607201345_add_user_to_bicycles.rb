class AddUserToBicycles < ActiveRecord::Migration[7.0]
  def change
    add_reference :bicycles, :user, null: false, foreign_key: true
  end
end
