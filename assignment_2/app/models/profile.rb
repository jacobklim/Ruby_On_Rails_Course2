class Profile < ActiveRecord::Base
  belongs_to :user

  validate :first_name_or_last_name
  validates :gender, inclusion: ["male", "female"] 
  validate :male_not_sue

  def first_name_or_last_name
  	if first_name.nil? && last_name.nil?
  		errors.add(:base, "Both cannot be null")
  	end
  end

  def male_not_sue
  	if gender == "male" and first_name == "Sue"
  		errors.add(:base, "No male should be names Sue")
  	end
  end

  def self.get_all_profiles(min_date, max_date)
  	Profile.where("birth_year BETWEEN :min_birth_date AND :max_birth_date", 
  		min_birth_date: min_date, max_birth_date: max_date).order(birth_year: :asc)

  	
  end

end
