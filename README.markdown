Arbitrary Date Ranges
=====================

You can create a Range with a beginning and end Date using the convenience methods 'for' and 'from'. 'for' will create a range into the future while 'from' creates a range into the past.

	TimeCrisis::Date.today.for(2, 'years')
     => #<TimeCrisis::Date 2009-09-22>..#<TimeCrisis::Date 2011-09-21> 

	TimeCrisis::Date.today.from(2, 'years')
	 => #<TimeCrisis::Date 2007-09-23>..#<TimeCrisis::Date 2009-09-22>

If you want to be more literal in your syntax, you can use the range method directly:

	TimeCrisis::Date.today.range(2, 'months', 'future')
	 => #<TimeCrisis::Date 2009-09-22>..#<TimeCrisis::Date 2009-11-21>

	TimeCrisis::Date.today.range(2, 'months', 'past')
	 => #<TimeCrisis::Date 2009-07-23>..#<TimeCrisis::Date 2009-09-22>

There is also a class method for defining ranges that allows you to specify a beginning and end for the range, or just one of beginning or end and then the scale (months, years) and unit (number of scale).

	TimeCrisis::Date.range(:begin => Date.today, :scale => 'months', :unit => 3)
	 => #<TimeCrisis::Date 2009-09-22>..#<TimeCrisis::Date 2009-12-21>

	TimeCrisis::Date.range(:begin => Date.civil(2008, 3, 1), :end => Date.civil(2008, 12, 31))
	 => #<TimeCrisis::Date 2008-03-01>..#<TimeCrisis::Date 2008-12-31>

Named Months
============

A range of dates for a month can be created using that month's name, optionally passing in a year.

	TimeCrisis::Date.february # 28 days in feb 2009
	 => #<TimeCrisis::Date 2009-02-01>..#<TimeCrisis::Date 2009-02-28>

	TimeCrisis::Date.february(2008) # 29 days in feb 2008
	 => #<TimeCrisis::Date 2008-02-01>..#<TimeCrisis::Date 2008-02-29>


Meteorological Season Calculations
==================================

	TimeCrisis::Date.beginning_of_meteorological_spring
	 => #<TimeCrisis::Date 2009-03-01>

	TimeCrisis::Date.beginning_of_meteorological_spring(2008)
	 => #<TimeCrisis::Date 2008-03-01> 

	TimeCrisis::Date.civil(2009, 4, 1).meteorological_spring?
	 => true 

	TimeCrisis::Date.civil(2009, 4, 1).meteorological_winter?
	 => false 

	TimeCrisis::Date.civil(2009, 10, 1).meteorological_season
	 => "fall" 



Copyright (c) 2009 Travis Tilley. See LICENSE for details.
