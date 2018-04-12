module Analysis
  module Relations
    class Users < ROM::Relation[:sql]
      schema(:users, infer: true) do
        associations do
          has_many :tasks
        end
      end
    end
  end
end
