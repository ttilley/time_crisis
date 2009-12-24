require 'time_crisis/support/time_with_zone'

module TimeCrisis
  class Time
    class << self
      attr_accessor :zone_default

      def zone
        Thread.current[:time_zone] || zone_default
      end

      def zone=(time_zone)
        Thread.current[:time_zone] = get_zone(time_zone)
      end

      def use_zone(time_zone)
        old_zone, ::TimeCrisis::Time.zone = ::TimeCrisis::Time.zone, get_zone(time_zone)
        yield
      ensure
        ::TimeCrisis::Time.zone = old_zone
      end

      def current
        ::TimeCrisis::Time.zone_default ? ::TimeCrisis::Time.zone.now : ::TimeCrisis::Time.now
      end

      private
      
      def get_zone(time_zone)
        return time_zone if time_zone.nil? || time_zone.is_a?(TimeCrisis::TimeZone)
        unless time_zone.respond_to?(:period_for_local)
          time_zone = TimeCrisis::TimeZone[time_zone] || TimeCrisis::TZInfo::Timezone.get(time_zone) rescue nil
        end
        if time_zone
          time_zone.is_a?(TimeCrisis::TimeZone) ? time_zone : TimeCrisis::TimeZone.create(time_zone.name, nil, time_zone)
        end
      end
    end

    def in_time_zone(zone = ::TimeCrisis::Time.zone)
      TimeCrisis::TimeWithZone.new(utc? ? self : getutc, ::TimeCrisis::Time.__send__(:get_zone, zone))
    end
  end
end
