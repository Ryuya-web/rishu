class Lessonsyo < ApplicationRecord
    belongs_to :user 
    
    has_many :likesyos
    has_many :likesyod_users, through: :likesyos, source: :user
    validates :title,presence: true
    validates :body,presence: true
    validates :teacher_name,presence: true
    def self.search(search)
        if search
           Lessonsyo.where(['title LIKE ?', "%#{search}%"])
        else
          Lessonsyo.all
        end
    end
    def self.searches(search)
      if search
         Lessonsyo.where(['teacher_name LIKE ?', "%#{search}%"])
      else
        Lessonsyo.all
      end
  end
end
