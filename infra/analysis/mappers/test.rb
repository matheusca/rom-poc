require 'rom/transformer'

class Users
  attr_reader :id, :name, :email
end

module Analysis
  module Mappers
    class Test < ROM::Transformer
      relation :users
      register_as :my_mapper

      map_array do
        set_ivars ::Users
      end
    end
  end
end
