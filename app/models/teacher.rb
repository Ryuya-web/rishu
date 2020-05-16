class Teacher < ApplicationRecord
    def self.search(search)
        if search
           Teacher.where(['name LIKE ?', "%#{search}%"])
        else
          Teacher.all
        end
    end
end
