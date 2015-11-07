class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_presence_of :name, unless: :guest?

  def name
    if guest?
      "Guest ##{ id }"
    else
      read_attribute[:name]
    end
  end

  def email_required?
    !guest?
  end

  def password_required?
    !guest?
  end

end
