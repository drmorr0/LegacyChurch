
module Queries

class TimeSeriesQuery
	Template = 'Show me the :category data from :year1 to :year2.'
	Params = {
			  :category => ['select_tag', ChurchData.get_all_properties(except: [:year, :church_id])],
			  :year1 => ['select_tag', 2000..2014],
			  :year2 => ['select_tag', 2000..2014],
		     }

	def self.execute(params)
	    Church.joins(:church_data).select("churches.*, church_data.year, #{params[:category]}")
			.where(church_data: {year: params[:year1]..params[:year2]})
			.where.not(church_data: {params[:category] => nil })
		    .order('churches.id asc')
	end

end

end




