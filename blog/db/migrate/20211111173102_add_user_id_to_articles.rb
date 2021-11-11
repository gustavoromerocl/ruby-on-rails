class AddUserIdToArticles < ActiveRecord::Migration[6.1]
  def change
    add_reference :articles, :user, null: false, foreign_key: true, default: 1 
  end
end
#si ya existen información ingresada de los modelos que se referencian, es necesrio asignarles un ususuario con default 1