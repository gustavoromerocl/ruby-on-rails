class Article < ApplicationRecord
    has_rich_text :content
    belongs_to :user #ingresar donde va el campo adicional o la llave foranea(singular)
    has_many :has_categories
    has_many :categories, through: :has_categories #through -> a través de 
    attr_accessor :category_elements

    def save_categories
        #category elementes -> string 1,2,3...
        #convertirlo en arreglo 
        category_array = category_elements.split(','); 
        #iterar ese arreglo
        category_array.each do |category_id|
            #Crear HasCategory <articcle_id:1, category_id:2>
            HasCategory.create(article: self, category_id: category_id)
        end

        
    end
end
