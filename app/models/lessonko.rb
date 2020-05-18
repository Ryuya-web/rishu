class Lessonko < ApplicationRecord
    belongs_to :user 
    
    has_many :likekos
    has_many :likekod_users, through: :likekos, source: :user
    validates :title,presence: true
    validates :body,presence: true
    validates :teacher_name,presence: true
    def self.search(search)
        if search
           Lessonko.where(['title LIKE ?', "%#{search}%"])
        else
          Lessonko.all
        end
    end
    def self.searches(search)
      if search
         Lessonko.where(['teacher_name LIKE ?', "%#{search}%"])
      else
        Lessonko.all
      end
  end
end
