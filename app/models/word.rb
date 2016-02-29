class Word < ActiveRecord::Base
	belongs_to :user
	self.inheritance_column = nil
	def self.to_csv
    CSV.generate do |csv|
      csv << column_names
      all.each do |word|
        csv << word.attributes.values_at(*column_names)
      end
    end
  end
end
