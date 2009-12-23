require 'time_crisis/tzinfo/info_timezone'

module TimeCrisis
  module TZInfo

    # A Timezone based on a DataTimezoneInfo.
    class DataTimezone < InfoTimezone #:nodoc:

      # Returns the TimezonePeriod for the given UTC time. utc can either be
      # a DateTime, Time or integer timestamp (Time.to_i). Any timezone
      # information in utc is ignored (it is treated as a UTC time).
      #
      # If no TimezonePeriod could be found, PeriodNotFound is raised.
      def period_for_utc(utc)
        info.period_for_utc(utc)
      end

      # Returns the set of TimezonePeriod instances that are valid for the given
      # local time as an array. If you just want a single period, use
      # period_for_local instead and specify how abiguities should be resolved.
      # Raises PeriodNotFound if no periods are found for the given time.
      def periods_for_local(local)
        info.periods_for_local(local)
      end
    end
  end
end
