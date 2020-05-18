class Lessonke < ApplicationRecord
    belongs_to :user 
    
    has_many :likekes
    has_many :likeked_users, through: :likekes, source: :user
    validates :title,presence: true
    validates :body,presence: true
    validates :teacher_name,presence: true
    def self.search(search)
        if search
           Lessonke.where(['title LIKE ?', "%#{search}%"])
        else
          Lessonke.all
        end
    end
    def self.searches(search)
      if search
         Lessonke.where(['teacher_name LIKE ?', "%#{search}%"])
      else
        Lessonke.all
      end
  end
end
