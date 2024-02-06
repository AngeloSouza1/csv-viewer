class CreateDados < ActiveRecord::Migration[7.1]
  def change
    create_table :dados do |t|
      t.string :nome
      t.integer :idade
      t.string :cidade

      t.timestamps
    end
  end
end
