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

# autenticación de usuarios

**instalar devise**

gem 'devise' -> gema de autenticación seguido de bundle install para instalar
rails generate devise:install -> ejecuta configuracion de devise

**tabla de usuarios**
 
rails generate devise User -> crea el modelo de usuario con sus configuraciones predeterminadas seguido de rails db:migrate para crear las tablas en la base de datos
rutas -> users/sing_in .. users/sing_up

**trabajar con la sesión actual**

user_signed_in? -> retorna true si la sesión esta iniciada
new_user_regustration_path -> ruta de registro
new_user_session_path -> ruta de inicio de sesión
destroy_user_session_path, method: delete -> ruta para cerrar sesion de devise
current_user.attribute -> accede al usuario actual de la sesión y sus atributos

**proteger rutas con login**
before_action :authenticate_user! -> valida que la sesión este iniciada antes de acceder al recurso

**modificar formularios de autenticación**
rails generate devise:views -> trae las vistas de devise para trabajarlas de manera local
/session/ -> vista de inicio de sesion
/registration/ -> vista de registro

# relación uno a muchos

**relacion entre usuarios y artículos**

rails generate migration add_user_id_to_articles user:references -> crea un archivo de migracion para crear la relación de uno a muchos entre la tabla user y articles, según la convención el nombre de la migracion debe especificar el id de la tabla y al final el modelo que pertenece a dicha tabla en plural (en plural). Por ultimo especificar el modelo y la palabra reservada references. (no olvidar ejecutar rails db:migrate para confirmar los cambios en el modelo)

**configurar relacion en los modelos**

belongs_to :user -> especifica de donde esta heredando el campo o a quien le pertenece
has_many :articles -> especifica que tabla le pertene

var_articles.user -> muesta el usuario al que pertenece
var_user.articles -> muestra los articulos que fueron generados por el usuario

**guardar autor de un artículo**

current_user.articles.create -> accede al metodo create mediante el usuario actual, considerando que para crear un nuevo articulo está la restriccion de que debe haber una sesion iniciada.