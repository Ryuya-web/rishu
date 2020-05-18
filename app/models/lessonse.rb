class Lessonse < ApplicationRecord
    belongs_to :user 
    
    has_many :likeses
    has_many :likesed_users, through: :likeses, source: :user
    validates :title,presence: true
    validates :body,presence: true
    validates :teacher_name,presence: true
    def self.search(search)
        if search
           Lessonse.where(['title LIKE ?', "%#{search}%"])
        else
          Lessonse.all
        end
    end
    def self.searches(search)
      if search
         Lessonse.where(['teacher_name LIKE ?', "%#{search}%"])
      else
        Lessonse.all
      end
  end
end
