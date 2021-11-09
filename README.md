# ruby-on-rails

# comandos

rails -v _-> obtiene la version de ror
rails s -> levanta el servidor
bundle exec rails webpacker:install -> instala webpacker
rails routes -> retorna todas las rutas y sus nombres
./bin/webpack-dev-server -> compila el servidor de archivos webpack para detectar fallos en las dependencias

# sintaxis
@variable -> variables declaradas con @ en el controlador quedan disponibles en la vista
json: @variable -> imprime el obajeto en formato json
form_with -> helper de rails para formularios


# estructura de carpetas
app/models
app/controllers
app/views
config/routes
db/migrate


# introduccion

doctrina de rails:
> https://rubyonrails.org/doctrine/es

# primeros pasos

**primer pagina**
rails generate controller Home index -> shorthand genera controlador y vista

**integrar bootstrap**
yarn add bootstrap -> agrega bootstrap al proyecto
yarn add jquery popper.js @popperjs/core -> instala las dependencias de bootstrap
yarn install -> instala las dependencias modificadas en el archivo package.json

./bin/webpack-dev-server -> compila el servidor de archivos webpack para detectar fallos en las dependencias

**modelos y migraciones**
rails generate model nameModel nameatribute:typeOfDate ** -> crea un modelo con sus atributos y un archivo de migracion, el nombre del modelo debe ser en ingles y en singular
rails db:migrate -> ejecuta las migraciones pendientes
rails db:rollback -> revierte la ultima migracion

**crear articulos**
rails generate controller {nameModel} -> crea un controlador para el modelo, se debe ingresar el nombre en plural
rails generate destroy {nameModel} -> elimina un controlador

**texto enriquecido con actionText**

rails action_text:install -> instala action text, ejecutar rails migrate posteriormente

# modularizar y reciclar código

**before_action y after_action**

before_action :method -> ejecuta el callback antes de las acciones en el controlador
after_action :method -> ejecuta el callback despues de las acciones en el controlador
except: [acciones] -> excepciona las acciones pasadas en el arreglo
only: [acciones] -> solo realiza en las acciones indicadas



