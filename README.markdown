Arbitrary Date Ranges
=====================

You can create a Range with a beginning and end Date using the convenience methods 'for' and 'from'. 'for' will create a range into the future while 'from' creates a range into the past.

	Date.today.for(2, 'years')
	 => Fri, 18 Sep 2009..Sat, 17 Sep 2011 

	Date.today.from(2, 'years')
	 => Wed, 19 Sep 2007..Fri, 18 Sep 2009 

If you want to be more literal in your syntax, you can use the range method directly:

	Date.today.range(2, 'months', 'future')
	 => Fri, 18 Sep 2009..Tue, 17 Nov 2009 

	Date.today.range(2, 'months', 'past')
	 => Sun, 19 Jul 2009..Fri, 18 Sep 2009 

There is also a class method for defining ranges that allows you to specify a beginning and end for the range, or just one of beginning or end and then the scale (months, years) and unit (number of scale).

	Date.range(:begin => Date.today, :scale => 'months', :unit => 3)
	 => Fri, 18 Sep 2009..Thu, 17 Dec 2009 

	Date.range(:begin => Date.civil(2008, 3, 1), :end => Date.civil(2008, 12, 31))
	 => Sat, 01 Mar 2008..Wed, 31 Dec 2008 

Named Months
============

A range of dates for a month can be created using that month's name, optionally passing in a year.

	Date.february # 28 days in feb 2009
	 => Sun, 01 Feb 2009..Sat, 28 Feb 2009 

	Date.february(2008) # 29 days in feb 2008
	 => Fri, 01 Feb 2008..Fri, 29 Feb 2008 


Meteorological Season Calculations
==================================

	Date.civil(2009, 4, 1).meteorological_spring?
	 => true 

	Date.civil(2009, 4, 1).meteorological_winter?
	 => false 

	Date.civil(2009, 10, 1).meteorological_season
	 => "fall" 

	Date.today.beginning_of_meteorological_summer
	 => Mon, 01 Jun 2009 



Copyright (c) 2009 Travis Tilley. See LICENSE for details.
