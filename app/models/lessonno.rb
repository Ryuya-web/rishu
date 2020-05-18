class Lessonno < ApplicationRecord
    belongs_to :user 
    
    has_many :likenos
    has_many :likenod_users, through: :likenos, source: :user
    validates :title,presence: true
    validates :body,presence: true
    validates :teacher_name,presence: true
    def self.search(search)
        if search
           Lessonno.where(['title LIKE ?', "%#{search}%"])
        else
          Lessonno.all
        end
    end
    def self.searches(search)
      if search
         Lessonno.where(['teacher_name LIKE ?', "%#{search}%"])
      else
        Lessonno.all
      end
  end
end
