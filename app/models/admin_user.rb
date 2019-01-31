class AdminUser < ApplicationRecord

	has_secure_password
	has_and_belongs_to_many :pages
	has_many :section_edits
	has_many :sections, :through => :section_edits

	scope :sorted, lambda {order("last_name ASC", "first_name ASC")}

	FORBIDDEN_NAME = ['ADMIN', 'admin', 'administrator', 'God', 'Jesus']
	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates_presence_of :first_name
	validates_length_of :first_name, :maximum => 25
	validates_presence_of :last_name
	validates_length_of :last_name, :maximum => 25
	validates_presence_of :username
	validates_length_of :username, :within => 6..25
	validates_uniqueness_of :username
	validates_presence_of :email
	validates_length_of :email, :maximum => 100
	validates_format_of :email, :with => EMAIL_REGEX
	validates_confirmation_of :email
	validates_confirmation_of :password
	validate :username_allowed


def username_allowed
	if FORBIDDEN_NAME.include?(username)
		errors.add(:username, "has been restricted for use.")
	end
	
end
def name
	[first_name, last_name].join(' ') 
	
end

end
