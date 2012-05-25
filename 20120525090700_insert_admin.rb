class InsertAdmin < ActiveRecord::Migration
  def up
    user = User.new
    user.username = "lea-id"
    user.email = "lea-id@yandex.ru"
    user.encrypted_password = User.password("111111")
    user.save
  end

  def down
  end
end
