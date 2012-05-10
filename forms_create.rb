#system 'bundle install'
#system 'rails generate devise:install'



# создаем пользователей
#system 'rails generate devise User'
#system 'rails generate devise:views'
#system 'rails generate migration add_admin_to_users admin:boolean'
#system 'rails generate migration add_username_to_users username:string'
#system 'rails generate migration add_fullname_to_users fullname:string'
#system 'rails generate migration add_activated_to_users activated:boolean'
#system 'rails generate cancan:ability'



# создаем роли пользователей
#system 'rails generate scaffold Role name:string'
# создаем связь has_and_belongs_to_many
#system 'rails generate model users_roles user:references role:references --no-id --no-timestamps'



# Создаем контроллер 'admin/users'
#system 'rails generate controller ''admin/users'' index show edit'



# входящие документы
#system 'rails generate scaffold Incoming year_at:integer serial_no:integer doc_no:string doc_date:date address:string description:string copy_count:integer copy_no:integer pages:integer in_out_no:integer delo_no:integer delo_pages:string attach:string user:references'
#system 'rails generate migration add_incomings_trigger'



# добавляем вторую модель - к исполнению
#system 'rails generate model Execution year_at:integer serial_no:integer resolution:string execute_to:date data_control:string done:string user:references incoming:references'
#system 'rails generate controller Executions index show new edit lookup'
#system 'rails generate migration add_executions_trigger'
# добавляем второй контроллер
#system 'rails generate controller ''incomings/executions'' index show new edit'



# добавляем третью модель - исходящие документы
#system 'rails generate model Outgoing year_at:integer serial_no:integer doc_no:string doc_date:date address:string description:string copy_count:integer copy_no:integer pages:integer in_out_no:integer delo_no:integer delo_pages:string attach:string user:references incoming:references'
#system 'rails generate controller Outgoings index show new edit lookup'
#system 'rails generate migration add_outgoings_trigger'
# добавляем второй контроллер
#system 'rails generate controller ''incomings/executions/outgoings'' index show new edit'



# добавляем вторую модель - к сведению
#system 'rails generate model Note year_at:integer date_incoming:date serial_no:integer date_finishing:date user:references incoming:references'
#system 'rails generate controller Notes index show new edit'
#system 'rails generate migration add_notes_trigger'
# добавляем второй контроллер
#system 'rails generate controller ''incomings/notes'' index show new edit'



# приказы и директивы
#system 'rails generate scaffold Order year_at:integer serial_no:integer sign_date:date someone:string description:string copy_count:integer attach:string'
#system 'rails generate migration add_orders_trigger'



# добавляем вторую модель - отправленные
#system 'rails generate model OrderSent who:string letter:string copy_count:integer delo:string order:references'
#system 'rails generate controller OrderSents index show new edit'



#???system 'rails generate scaffold internals title:string description:string attach:string user:references'
#system 'rails generate model Internal title:string description:string attach:string user:references'
#system 'rails generate controller ''users/internals'''
#system 'rails generate controller ''user/incomings'' index show'
#system 'rails generate controller ''user/outgoings'' index show'
#system 'rails generate controller ''user/notes'' index show'
#system 'rails generate controller ''user/executions'' index show'
