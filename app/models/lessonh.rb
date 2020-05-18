class Lessonh < ApplicationRecord
    belongs_to :user 
    
    has_many :likehs
    has_many :likehd_users, through: :likejs, source: :user
    validates :title,presence: true
    validates :body,presence: true
    validates :teacher_name,presence: true
    def self.search(search)
        if search
           Lessonh.where(['title LIKE ?', "%#{search}%"])
        else
          Lessonh.all
        end
    end
    def self.searches(search)
      if search
         Lessonh.where(['teacher_name LIKE ?', "%#{search}%"])
      else
        Lessonh.all
      end
  end
end
