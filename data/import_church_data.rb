#!/usr/bin/env ruby

$: << "." # search the local directory for additional files

require 'roo-xls'
require 'sqlite3'
require 'db_cols'

def capitalize_words(str)
	return unless str
	str.split.map(&:capitalize).join(' ')
end

# Open a connection to the database and spreadsheet
db = SQLite3::Database.new "legacy.db"
data = Roo::Spreadsheet.open(ARGV[0], extension: :xls)

pst = db.prepare "select * from church_data limit 1"
year = ARGV[0].scan(/Table1-(\d{4})/)[0][0]

xls_cols = {}
db_cols = pst.columns

# Record the indices of the spreadsheet column names
data.row(1).each_with_index do |val, index|
	if val == 'ChurchNo'
		xls_cols["church_id"] = index
	elsif val == 'ChurchName'
		xls_cols["name"] = index
	elsif val == 'City'
		xls_cols["city"] = index
	elsif val == 'State'
		xls_cols["state"] = index
	elsif val == 'DistNo'
		xls_cols["district"] = index
	else 
		val.match(/.*\(([A-Za-z\/]+)\)/) do |m|
			key = m[1].gsub(/[^A-Za-z]/, '')
			xls_cols[key] = index 
		end
	end
end

# Check to see which DB columns aren't present in the spreadsheet, and vice versa
check_xls_cols(xls_cols, db_cols)
check_db_cols(xls_cols, db_cols)

puts "There are #{data.last_row} rows."
print "Continue? [y/n] "
response = STDIN.gets.chomp

exit unless response[0] == 'y'
puts "Importing..."

# Add each row from the spreadsheet to the database; this is slow and kindof thrashes
# the hard disk, it would probably be better to aggregate the queries
data.each do |row|
	next unless row[xls_cols["church_id"]].to_i != 0

	hdrs = db_cols.join(",")
	sql = "insert into church_data (#{hdrs}) values (#{('?,' * db_cols.length)[0..-2]})"

	# compute the values to insert into the prepared statment
	values = []
	db_cols.each do |col|
		value = nil
		if col == "year"
			value = year.to_i
		else
			value = get_column_value(row, col, xls_cols)
		end
		values << value
	end
	id = row[xls_cols["church_id"]].to_i
	name = capitalize_words(row[xls_cols["name"]])
	district = row[xls_cols["district"]].to_i
	city = capitalize_words(row[xls_cols["city"]])
	state = row[xls_cols["state"]].upcase unless row[xls_cols["state"]].nil?

	if values.any? then
		# First check to see if a church with the given id is present in the churches table;
		# if not, add it
		if db.execute("select * from churches where id=?", id).empty? then
			db.execute("insert into churches (id, name, district, city, state) values (?,?,?,?,?)",
					   [id, name, district, city, state])
		end

		# Next, add in the data to the church_data table
		db.execute(sql, values)
	else
		print "Church ID #{id} (#{name}) has no data; ignoring\n"
	end
end

puts "Done!"


