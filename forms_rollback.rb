#system 'rails destroy controller ''users/executions'''
#system 'rails destroy controller ''users/notes'''
#system 'rails destroy controller ''users/outgoings'''
#system 'rails destroy controller ''users/incomings'''
#system 'rake db:rollback'
#system 'rails destroy scaffold ''internals'''



# ������� ������ ������ - ������������
#system 'rake db:rollback'
#system 'rails destroy controller OrderSents'
#system 'rails destroy model OrderSent'



# ������� ������� � ���������
#system 'rake db:rollback STEP=2'
#system 'rails destroy migration add_orders_trigger'
#system 'rails destroy scaffold Order'



# ������� ������ ����������
#system 'rails destroy controller ''incomings/notes'''
# ������� ������ ������ - � ��������
#system 'rake db:rollback STEP=2'
#system 'rails destroy migration add_notes_trigger'
#system 'rails destroy controller Notes'
#system 'rails destroy model Note'



# ������� ������ ����������
#system 'rails destroy controller ''incomings/executions/outgoings'''
# ������� ������ ������ - � ����������
#system 'rake db:rollback STEP=2'
#system 'rails destroy migration add_executions_trigger'
#system 'rails destroy controller Executions'
#system 'rails destroy model Execution'



# ������� ������ ����������
#system 'rails destroy controller ''incomings/executions'''
# ������� ������ ������ - � ����������
#system 'rake db:rollback STEP=2'
#system 'rails destroy migration add_outgoings_trigger'
#system 'rails destroy controller Outgoings'
#system 'rails destroy model Outgoing'



# ������� �������� ���������
#system 'rake db:rollback STEP=2'
#system 'rails destroy migration add_incomings_trigger'
#system 'rails destroy scaffold Incomings'



#system 'rails destroy controller Setting'
#system 'rails rake db:rollback'
#system 'rails destroy migration UsersHaveAndBelongToManyRoles'
#system 'rails rake db:rollback'
#system 'rails destroy scaffold Role'
#system 'rails rake db:rollback'
#system 'rails destroy migration add_username_to_users'
#system 'rails destroy controller ''admin/users'''
#system 'rails destroy controller 'user/settings'''
#system 'rails destroy devise User'
