
module Queries

class TimeSeriesQuery
	Template = 'Show me the :property data from :year1 to :year2, grouped by :grouping.'
	Params = {
			  :property => ['select_tag', ChurchData.get_all_properties(except: [:year, :church_id])],
			  :year1 => ['select_tag', 2000..2014],
			  :year2 => ['select_tag', 2000..2014],
			  :grouping => ['select_tag', ["None", "District", "City", "Value"]],
		     }

	def self.execute(params)
	    Church.joins(:church_data).select("churches.*, church_data.year, #{params[:property]}")
			.where(church_data: {year: params[:year1]..params[:year2]})
			.where.not(church_data: {params[:property] => nil })
		    .order('churches.id asc')
	end

	def self.js()
<<END
<script type="text/javascript">
	$("#church_grouping").change(function(evt) {
		if ($("#time-series-query .chart").height() != 0) {
			$("#time-series-query .query").submit()
		}
	});
</script>
END
	end

end

end





