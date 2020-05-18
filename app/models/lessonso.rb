class Lessonso < ApplicationRecord
    belongs_to :user 
    
    has_many :likesos
    has_many :likesod_users, through: :likesos, source: :user
    validates :title,presence: true
    validates :body,presence: true
    validates :teacher_name,presence: true
    def self.search(search)
        if search
           Lessonso.where(['title LIKE ?', "%#{search}%"])
        else
          Lessonso.all
        end
    end
    def self.searches(search)
      if search
         Lessonso.where(['teacher_name LIKE ?', "%#{search}%"])
      else
        Lessonso.all
      end
  end
end
