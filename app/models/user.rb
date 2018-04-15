class User < ApplicationRecord
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :profile
  has_many :job_applications

  def has_profile?
    false
  end

  def already_applied?
  end

  def is_employer?
    self.class.name == "Employer"
  end
end
