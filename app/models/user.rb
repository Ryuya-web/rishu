class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,:authentication_keys => [:name]
  has_many :lessons, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liked_lessons, through: :likes, source: :lesson

  has_many :lessonhs, dependent: :destroy
  has_many :likehs, dependent: :destroy
  has_many :likehd_lessonhs, through: :likehs, source: :lessonh

  has_many :lessonsyos, dependent: :destroy
  has_many :likesyos, dependent: :destroy
  has_many :likesyod_lessonsyos, through: :likesyos, source: :lessonsyo

  has_many :lessonses, dependent: :destroy
  has_many :likeses, dependent: :destroy
  has_many :likesed_lessonses, through: :likeses, source: :lessonse

  has_many :lessonkes, dependent: :destroy
  has_many :likekes, dependent: :destroy
  has_many :likeked_lessons, through: :likekes, source: :lessonke

  has_many :lessonbs, dependent: :destroy
  has_many :likebs, dependent: :destroy
  has_many :likebd_lessonbs, through: :likebs, source: :lessonb

  has_many :lessonkos, dependent: :destroy
  has_many :likekos, dependent: :destroy
  has_many :likekod_lessonkos, through: :likekos, source: :lessonko

  has_many :lessonris, dependent: :destroy
  has_many :likeris, dependent: :destroy
  has_many :likerid_lessonris, through: :likeris, source: :lessonri

  has_many :lessonnos, dependent: :destroy
  has_many :likenos, dependent: :destroy
  has_many :likenod_lessonnos, through: :likenos, source: :lessonno

  has_many :lessonsos, dependent: :destroy
  has_many :likesos, dependent: :destroy
  has_many :likesod_lessonsos, through: :likesos, source: :lessonso

  has_many :lessonkyos, dependent: :destroy
  has_many :likekyos, dependent: :destroy
  has_many :likekyod_lessonkyos, through: :likekyos, source: :lessonkyo

  def already_likehd?(lessonh)
    self.likehs.exists?(lessonh_id: lessonh.id)
  end
  def already_likesyod?(lessonsyo)
    self.likesyos.exists?(lessonsyo_id: lessonsyo.id)
  end
  def already_likesed?(lessonse)
    self.likeses.exists?(lessonse_id: lessonse.id)
  end
  def already_likeked?(lessonke)
    self.likekes.exists?(lessonke_id: lessonke.id)
  end
  def already_likebd?(lessonb)
    self.likebs.exists?(lessonb_id: lessonb.id)
  end
  def already_likekod?(lessonko)
    self.likekos.exists?(lessonko_id: lessonko.id)
  end
  def already_likerid?(lessonri)
    self.likeris.exists?(lessonri_id: lessonri.id)
  end
  def already_likenod?(lessonno)
    self.likenos.exists?(lessonno_id: lessonno.id)
  end
  def already_likesod?(lessonso)
    self.likesos.exists?(lessonso_id: lessonso.id)
  end
  def already_likekyod?(lessonkyo)
    self.likekyos.exists?(lessonkyo_id: lessonkyo.id)
  end
  def already_liked?(lesson)
    self.likes.exists?(lesson_id: lesson.id)
  end
  def email_required?
    false
  end
   
  def email_changed?
    false
  end
  def will_save_change_to_email?
    false
  end
end
