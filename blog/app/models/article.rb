class Article < ApplicationRecord
    has_rich_text :content
    belongs_to :user #ingresar donde va el campo adicional o la llave foranea(singular)
    has_many :has_categories, dependent: :delete_all #:destroy
    has_many :categories, through: :has_categories #through -> a través de 
    attr_accessor :category_elements

    before_destroy :before_delete
    after_destroy :after_delete

    def before_delete
        puts "Antes de eliminar"
    end

    def after_delete
        puts "Despues de eliminar"
    end

    def save_categories
        #category elementes -> string 1,2,3...
        #convertirlo en arreglo 
        #category_array = category_elements.split(','); 
        #iterar ese arreglo
        return  has_categories.destroy_all if category_elements.nil? || category_elements.empty? 

        has_categories.where.not(category_id: category_elements).destroy_all

        category_elements.each do |category_id|
            #Crear HasCategory <articcle_id:1, category_id:2>_

            #valida que el la categoria no exista ya en el articulo, para evitar crear duplicados
            HasCategory.find_or_create_by(article: self, category_id: category_id)
=begin
            unless HasCategory.where(article:self, category_id: category_id).any?
                HasCategory.create(article: self, category_id: category_id)
            end

            if HasCategory.where(article:self, category_id: category_id).any?
            else
                HasCategory.create(article: self, category_id: category_id)
            end
=end
        end
    end
end
