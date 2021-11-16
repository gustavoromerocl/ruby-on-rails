class Article < ApplicationRecord
    has_rich_text :content
    belongs_to :user #ingresar donde va el campo adicional o la llave foranea(singular)
    has_many :has_categories
    has many :categories, through: :has_categories #through -> a través de 
end
