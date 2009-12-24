class DateTime
  def in_time_zone(zone = ::Time.zone)
    TimeCrisis::TimeWithZone.new(utc? ? self : getutc, ::TimeCrisis::Time.__send__(:get_zone, zone))
  end
end
