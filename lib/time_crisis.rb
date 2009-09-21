module TimeCrisis; end

# the support directory is a simplified version of the same methods in
# ActiveSupport, and are completely unnecessary if we're actually
# using that library. I just didn't want to depend on it.
require 'time_crisis/support' unless defined?(ActiveSupport)

require 'time_crisis/meteorological_seasons'
require 'time_crisis/date_range'
require 'time_crisis/named_months'
