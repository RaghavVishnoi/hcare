class FirstAid < ActiveRecord::Base


	has_many :treatments
	attr_accessor :prerequisites
	#accepts_nested_attributes_for :treatments, :allow_destroy => true
 
	#validates :symptoms, presence: true, uniqueness: true
	validate  :status 
	validate  :treatments

	def self.treatments(treatments,id)
		treatments = treatments.split('/n')
		treatments.each do |treatment|
			Treatment.create(treatment: treatment,first_aid_id: id)
		end
		
	end

	def self.first_aid_detail(symptom)
		@first_aid = FirstAid.find_by('lower(symptoms) LIKE ?',"%#{symptom.downcase}")
		if @first_aid != nil
			first_aid = {}
			treatments = []	
			first_aid[:symptom] = @first_aid.symptoms
			@treatments = @first_aid.treatments
			if @treatments != nil
				@treatments.each do |treatment|
					treatments.push(treatment.treatment.gsub("\t","").lstrip.chop)
				end
		    end
			first_aid[:treatments] = treatments
			first_aid
		end	
	end

	def self.first_aid_data(symptoms)
		first_aid = []
		symptoms.each do |symptom|
			first_aid.push(first_aid_detail(symptom))
		end
		first_aid
	end

end