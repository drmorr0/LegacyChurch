class ChurchData < ActiveRecord::Base
	belongs_to :church

	def self.get_prop_tree()
		return @props
	end

	@props = [{ descriptor: 'Membership', 
			    children: [
					{descriptor: 'Total Membership', value: 'MEMBTOT'},
					{descriptor: 'Members Received on Profession of Faith', value: 'RECPROF'},
					{descriptor: 'Members Restored by Affirmation', value: 'RECREST'},
					{descriptor: 'Members Transferred from other UM churches', value: 'RECUMC'},
					{descriptor: 'Members Transferred from non-UM churches', value: 'RECOTH'},
					{descriptor: 'Members Removed by Conference Action', value: 'REMCHR'},
					{descriptor: 'Withdrawn Members', value: 'REMWITH'},
					{descriptor: 'Members Transferring to other UM churches', value: 'REMUMC'},
					{descriptor: 'Members Transferring to other non-UM churches', value: 'REMOTH'},
					{descriptor: 'Members Who Have Died', value: 'REMDEATH'},
					{descriptor: '------'},
					{descriptor: 'Previous Year Membership Total', value: 'MEMBPREV'},
					{descriptor: 'Additive Previous Year Membership Corrections', value: 'RECCOR'},
					{descriptor: 'Subtractive Previous Year Membership Corrections', value: 'REMCOR'},
					{descriptor: '------'},
					{descriptor: 'Male Members', value: 'MEMBFEM'},
					{descriptor: 'Female Members', value: 'MEMBMALE'},
					{descriptor: 'Asian Members', value: 'MEMBA'},
					{descriptor: 'African American/Black Members', value: 'MEMBAAB'},
					{descriptor: 'Hispanic Members', value: 'MEMBH'},
					{descriptor: 'Native American Members', value: 'MEMBN'},
					{descriptor: 'Pacific Islander Members', value: 'MEMBP'},
					{descriptor: 'Caucasian Members', value: 'MEMBW'},
					{descriptor: 'Multi-Racial Members', value: 'MEMBMR'},
			  ]},

			  { descriptor: 'Attendance',
	   		 	children: [
					{descriptor: 'Average Worship Attendance', value: 'AVATTWOR'},
					{descriptor: 'Average Sunday School Attendance', value: 'CSATTSUN'},
					{descriptor: 'Total Christian Formation/Small Group Attendance', value: 'CFTOTAL'},
					{descriptor: 'Children in Christian Formation/Small Groups', value: 'CFCHILD'},
					{descriptor: 'Youth in Christian Formation/Small Groups', value: 'CFYOUTH'},
					{descriptor: 'Young Adults in Christian Formation/Small Groups', value: 'CFYADLT'},
					{descriptor: 'Adults in Christian Formation/Small Groups', value: 'CFOADLT'},
					{descriptor: 'Enrollment in Confirmation Classes', value: 'CONFIRM'},
					{descriptor: 'VBS Participants', value: 'VBSPART'},
			  ]},

			  { descriptor: 'Baptism',
	   			children: [
					{descriptor: 'Total Baptisms', value: 'NUMBAPT'},
					{descriptor: 'Children Baptized', value: 'BAPTCHILD'},
					{descriptor: 'Adults Baptized', value: 'BAPTADULT'},
					{descriptor: 'Baptized Members who have not become Professing Members', value: 'PREPMEMB'},
			  ]},

			  { descriptor: 'Missions',
	   			children: [
					{descriptor: 'UMVIM Teams', value: 'UMVIM'},
					{descriptor: 'Persons on UMVIM Teams', value: 'UMVIMPAR'},
					{descriptor: 'Persons Engaged in Missions', value: 'MISSENGAGE'},
					{descriptor: 'Number of Persons Served by Community Daycare/Education', value: 'DAYSRVD'},
					{descriptor: 'Number of Persons Served by Community Outreach', value: 'OUTSRVD'},
					{descriptor: 'Membership in UMM', value: 'UMMMEMB'},
					{descriptor: 'Membership in UMW', value: 'UMWMEMB'},
					{descriptor: 'Amount Paid for UMM Projects', value: 'UMMPROG'},
					{descriptor: 'Amount Paid for UMW Projects', value: 'UMWWORK'},
			  ]},

			  { descriptor: 'Assets',
	   			children: [
					{descriptor: 'Market Value of Church Property', value: 'VALPROP'},
					{descriptor: 'Market Value of Other Assets', value: 'VALOTH'},
					{descriptor: 'Debt Secured by Physical Assets', value: 'DEBTCHUR'},
					{descriptor: 'Other Debt', value: 'DEBTOTH'},
			  ]},

			  { descriptor: 'Expenditures',
	   			children: [
					{descriptor: 'Total Expenditures Paid', value: 'GRANDTOT'},
					{descriptor: 'Total Apportionments', value: 'TOTAPP'},
					{descriptor: 'Total Apportionments Paid', value: 'APPPAID'},
					{descriptor: 'General Advance Specials Paid', value: 'GENADV'},
					{descriptor: 'World Service Specials Paid', value: 'WSSPEC'},
					{descriptor: 'Annual Conference Advance Specials Paid', value: 'CONFADV'},
					{descriptor: 'Youth Service Fund Paid', value: 'YSF'},
					{descriptor: 'Other Funds Paid', value: 'BENOTHA'},
					{descriptor: 'Special Sunday Offerings Paid', value: 'ACSPSUN'},
					{descriptor: 'Given Directly to UM causes', value: 'UMDIRECT'},
					{descriptor: 'Given Directly to non-UM causes', value: 'OTHDIRECT'},
					{descriptor: 'General Special Sunday Offerings Paid', value: 'GENCHROF'},
					{descriptor: 'Pension Benefits Paid', value: 'PENBILLED'},
					{descriptor: 'Healthcare Benefits Paid', value: 'HLTHBILLED'},
					{descriptor: 'Pastor Base Compensation', value: 'COMPPAST'},
					{descriptor: 'Associate Pastor Base Compensation', value: 'COMPASSC'},
					{descriptor: 'Housing Expenses', value: 'TOTPAST'},
					{descriptor: 'Reimbursments', value: 'TOTREMB'},
					{descriptor: 'Cash Allowances', value: 'TOTCASH'},
					{descriptor: 'Deacon Salary and Benefits', value: 'DEACOMP'},
					{descriptor: 'Other Salary and Benefits', value: 'OTHCOMP'},
					{descriptor: 'Local Church Program Expenses', value: 'PROGEXP'},
					{descriptor: 'Operating Expenses', value: 'OPEREXP'},
					{descriptor: 'Debts Paid', value: 'PRININT'},
					{descriptor: 'Capital Expenditures', value: 'BLDGIMPV'},
					{descriptor: 'Parsonage Rental Paid', value: 'RENTAL'},
			  ]},

			  { descriptor: 'Giving',
	   			children: [
					{descriptor: 'Households Giving to Church', value: 'NUMPLEDG'},
					{descriptor: 'Total Income Received for Budget', value: 'ANNOPP'},
					{descriptor: 'Funds Received Through Pledges', value: 'BENOTHAa'},
					{descriptor: 'Funds Received from Identified Givers', value: 'BENOTHAb'},
					{descriptor: 'Funds Received from Unidentified Givers', value: 'BENOTHAc'},
					{descriptor: 'Funds Received from Interest and Dividends', value: 'BENOTHAd'},
					{descriptor: 'Funds Received from Sale of Assets', value: 'BENOTHAe'},
					{descriptor: 'Funds Received from Building Use Fees', value: 'BENOTHAf'},
					{descriptor: 'Other Sources of Income', value: 'BENOTHAg'},
					{descriptor: '------'},
					{descriptor: 'Total Income Received for Capital Campaigns and Projects', value: 'CAPFUN'},
					{descriptor: 'Funds Received from Capital Campaigns', value: 'CAPFUNa'},
					{descriptor: 'Funds Received from Memorials', value: 'CAPFUNb'},
					{descriptor: 'Funds Received from Other Projects', value: 'CAPFUNc'},
					{descriptor: 'Funds Received from Special Sundays Giving', value: 'CAPFUNd'},
					{descriptor: '------'},
					{descriptor: 'Total Income From Outside the Church', value: 'FUNDSCR'},
					{descriptor: 'Equitable Compensation Funds Received', value: 'FUNDSCRa'},
					{descriptor: 'Advance Special Funds Received', value: 'FUNDSCRb'},
					{descriptor: 'Grants and Institutional Support Received', value: 'FUNDSCRc'},
			  ]},

			  { descriptor: 'Miscellaneous',
	   			children: [
					{descriptor: 'Other Church Constituents', value: 'CONSTIT'},
					{descriptor: 'Sunday School Classes', value: 'CSCLASS'},
					{descriptor: 'Other Ongoing Classes', value: 'ONGOCLASS'},
					{descriptor: 'Short-Term Classes and Groups', value: 'SHORTCLASS'},

					{descriptor: 'Average Attendance in Short-Term Classes', value: 'CSATTSHT'},
					{descriptor: 'United Methodist Youth Membership', value: 'UMYFMEMB'},
					{descriptor: 'Amount Paid for UMYF Projects', value: 'UMYFPROJ'},
					{descriptor: 'Amount Paid to UMW Treasurer', value: 'UMWTREAS'},
			  ]},
			]
end
