class Lessonkyo < ApplicationRecord
    belongs_to :user 
    
    has_many :likekyos
    has_many :likekyod_users, through: :likekyos, source: :user
    validates :title,presence: true
    validates :body,presence: true
    validates :teacher_name,presence: true
    def self.search(search)
        if search
           Lessonkyo.where(['title LIKE ?', "%#{search}%"])
        else
          Lessonkyo.all
        end
    end
    def self.searches(search)
      if search
         Lessonkyo.where(['teacher_name LIKE ?', "%#{search}%"])
      else
        Lessonkyo.all
      end
  end
end
