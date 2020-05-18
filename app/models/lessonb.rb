class Lessonb < ApplicationRecord
    belongs_to :user 
    
    has_many :likebs
    has_many :likebd_users, through: :likebs, source: :user
    validates :title,presence: true
    validates :body,presence: true
    validates :teacher_name,presence: true
    def self.search(search)
        if search
           Lessonb.where(['title LIKE ?', "%#{search}%"])
        else
          Lessonb.all
        end
    end
    def self.searches(search)
      if search
         Lessonb.where(['teacher_name LIKE ?', "%#{search}%"])
      else
        Lessonb.all
      end
  end
end
