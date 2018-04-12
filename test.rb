require 'rom'
require 'rom-repository'

RomConfiguration = ROM.container(:sql, 'sqlite::memory') do |config|
  config.default.create_table(:users) do
    primary_key :id
    column :name, String, null: false
    column :email, String, null: false
  end

  config.default.create_table(:tasks) do
    primary_key :id
    foreign_key :user_id, :users
    column :title, String, null: false
  end

  config.auto_registration('./infra/**')
end

class UserRepo < ROM::Repository[:users]
  commands :create
  auto_struct false

  def create_with_tasks(user)
    users.combine(:tasks).command(:create).call(user)
  end

  def all
    users.map_with(:my_mapper).to_a
  end
end
