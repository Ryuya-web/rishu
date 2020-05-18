class Lessonri < ApplicationRecord
    belongs_to :user 
    
    has_many :likeris
    has_many :likerid_users, through: :likeris, source: :user
    validates :title,presence: true
    validates :body,presence: true
    validates :teacher_name,presence: true
    def self.search(search)
        if search
           Lessonri.where(['title LIKE ?', "%#{search}%"])
        else
          Lessonri.all
        end
    end
    def self.searches(search)
      if search
         Lessonri.where(['teacher_name LIKE ?', "%#{search}%"])
      else
        Lessonri.all
      end
  end
end
