
module Queries

class Base
	def self.get_all
		(Dir.glob(File.join(Rails.root, "app", "lib", "queries", "*")).collect { 
			|file_path| 
			basename = File.basename(file_path, '.rb')
			('Queries::' + basename.camelize).constantize 
		}).delete_if {|q| q == Queries::Base }
	end
end

class AbstractQuery
	def self.js()
		return ''
	end

	def self.js_args()
		return ''
	end
end

end


