require 'time_crisis/support/ext/object/blank'

module TimeCrisis
  class TimeZone
    unless const_defined?(:MAPPING)
      # Keys are Rails TimeZone names, values are TZInfo identifiers
      MAPPING = {
        "International Date Line West" => "Pacific/Midway",
        "Midway Island"                => "Pacific/Midway",
        "Samoa"                        => "Pacific/Pago_Pago",
        "Hawaii"                       => "Pacific/Honolulu",
        "Alaska"                       => "America/Juneau",
        "Pacific Time (US & Canada)"   => "America/Los_Angeles",
        "Tijuana"                      => "America/Tijuana",
        "Mountain Time (US & Canada)"  => "America/Denver",
        "Arizona"                      => "America/Phoenix",
        "Chihuahua"                    => "America/Chihuahua",
        "Mazatlan"                     => "America/Mazatlan",
        "Central Time (US & Canada)"   => "America/Chicago",
        "Saskatchewan"                 => "America/Regina",
        "Guadalajara"                  => "America/Mexico_City",
        "Mexico City"                  => "America/Mexico_City",
        "Monterrey"                    => "America/Monterrey",
        "Central America"              => "America/Guatemala",
        "Eastern Time (US & Canada)"   => "America/New_York",
        "Indiana (East)"               => "America/Indiana/Indianapolis",
        "Bogota"                       => "America/Bogota",
        "Lima"                         => "America/Lima",
        "Quito"                        => "America/Lima",
        "Atlantic Time (Canada)"       => "America/Halifax",
        "Caracas"                      => "America/Caracas",
        "La Paz"                       => "America/La_Paz",
        "Santiago"                     => "America/Santiago",
        "Newfoundland"                 => "America/St_Johns",
        "Brasilia"                     => "America/Sao_Paulo",
        "Buenos Aires"                 => "America/Argentina/Buenos_Aires",
        "Georgetown"                   => "America/Argentina/San_Juan",
        "Greenland"                    => "America/Godthab",
        "Mid-Atlantic"                 => "Atlantic/South_Georgia",
        "Azores"                       => "Atlantic/Azores",
        "Cape Verde Is."               => "Atlantic/Cape_Verde",
        "Dublin"                       => "Europe/Dublin",
        "Edinburgh"                    => "Europe/London",
        "Lisbon"                       => "Europe/Lisbon",
        "London"                       => "Europe/London",
        "Casablanca"                   => "Africa/Casablanca",
        "Monrovia"                     => "Africa/Monrovia",
        "UTC"                          => "Etc/UTC",
        "Belgrade"                     => "Europe/Belgrade",
        "Bratislava"                   => "Europe/Bratislava",
        "Budapest"                     => "Europe/Budapest",
        "Ljubljana"                    => "Europe/Ljubljana",
        "Prague"                       => "Europe/Prague",
        "Sarajevo"                     => "Europe/Sarajevo",
        "Skopje"                       => "Europe/Skopje",
        "Warsaw"                       => "Europe/Warsaw",
        "Zagreb"                       => "Europe/Zagreb",
        "Brussels"                     => "Europe/Brussels",
        "Copenhagen"                   => "Europe/Copenhagen",
        "Madrid"                       => "Europe/Madrid",
        "Paris"                        => "Europe/Paris",
        "Amsterdam"                    => "Europe/Amsterdam",
        "Berlin"                       => "Europe/Berlin",
        "Bern"                         => "Europe/Berlin",
        "Rome"                         => "Europe/Rome",
        "Stockholm"                    => "Europe/Stockholm",
        "Vienna"                       => "Europe/Vienna",
        "West Central Africa"          => "Africa/Algiers",
        "Bucharest"                    => "Europe/Bucharest",
        "Cairo"                        => "Africa/Cairo",
        "Helsinki"                     => "Europe/Helsinki",
        "Kyiv"                         => "Europe/Kiev",
        "Riga"                         => "Europe/Riga",
        "Sofia"                        => "Europe/Sofia",
        "Tallinn"                      => "Europe/Tallinn",
        "Vilnius"                      => "Europe/Vilnius",
        "Athens"                       => "Europe/Athens",
        "Istanbul"                     => "Europe/Istanbul",
        "Minsk"                        => "Europe/Minsk",
        "Jerusalem"                    => "Asia/Jerusalem",
        "Harare"                       => "Africa/Harare",
        "Pretoria"                     => "Africa/Johannesburg",
        "Moscow"                       => "Europe/Moscow",
        "St. Petersburg"               => "Europe/Moscow",
        "Volgograd"                    => "Europe/Moscow",
        "Kuwait"                       => "Asia/Kuwait",
        "Riyadh"                       => "Asia/Riyadh",
        "Nairobi"                      => "Africa/Nairobi",
        "Baghdad"                      => "Asia/Baghdad",
        "Tehran"                       => "Asia/Tehran",
        "Abu Dhabi"                    => "Asia/Muscat",
        "Muscat"                       => "Asia/Muscat",
        "Baku"                         => "Asia/Baku",
        "Tbilisi"                      => "Asia/Tbilisi",
        "Yerevan"                      => "Asia/Yerevan",
        "Kabul"                        => "Asia/Kabul",
        "Ekaterinburg"                 => "Asia/Yekaterinburg",
        "Islamabad"                    => "Asia/Karachi",
        "Karachi"                      => "Asia/Karachi",
        "Tashkent"                     => "Asia/Tashkent",
        "Chennai"                      => "Asia/Kolkata",
        "Kolkata"                      => "Asia/Kolkata",
        "Mumbai"                       => "Asia/Kolkata",
        "New Delhi"                    => "Asia/Kolkata",
        "Kathmandu"                    => "Asia/Kathmandu",
        "Astana"                       => "Asia/Dhaka",
        "Dhaka"                        => "Asia/Dhaka",
        "Sri Jayawardenepura"          => "Asia/Colombo",
        "Almaty"                       => "Asia/Almaty",
        "Novosibirsk"                  => "Asia/Novosibirsk",
        "Rangoon"                      => "Asia/Rangoon",
        "Bangkok"                      => "Asia/Bangkok",
        "Hanoi"                        => "Asia/Bangkok",
        "Jakarta"                      => "Asia/Jakarta",
        "Krasnoyarsk"                  => "Asia/Krasnoyarsk",
        "Beijing"                      => "Asia/Shanghai",
        "Chongqing"                    => "Asia/Chongqing",
        "Hong Kong"                    => "Asia/Hong_Kong",
        "Urumqi"                       => "Asia/Urumqi",
        "Kuala Lumpur"                 => "Asia/Kuala_Lumpur",
        "Singapore"                    => "Asia/Singapore",
        "Taipei"                       => "Asia/Taipei",
        "Perth"                        => "Australia/Perth",
        "Irkutsk"                      => "Asia/Irkutsk",
        "Ulaan Bataar"                 => "Asia/Ulaanbaatar",
        "Seoul"                        => "Asia/Seoul",
        "Osaka"                        => "Asia/Tokyo",
        "Sapporo"                      => "Asia/Tokyo",
        "Tokyo"                        => "Asia/Tokyo",
        "Yakutsk"                      => "Asia/Yakutsk",
        "Darwin"                       => "Australia/Darwin",
        "Adelaide"                     => "Australia/Adelaide",
        "Canberra"                     => "Australia/Melbourne",
        "Melbourne"                    => "Australia/Melbourne",
        "Sydney"                       => "Australia/Sydney",
        "Brisbane"                     => "Australia/Brisbane",
        "Hobart"                       => "Australia/Hobart",
        "Vladivostok"                  => "Asia/Vladivostok",
        "Guam"                         => "Pacific/Guam",
        "Port Moresby"                 => "Pacific/Port_Moresby",
        "Magadan"                      => "Asia/Magadan",
        "Solomon Is."                  => "Asia/Magadan",
        "New Caledonia"                => "Pacific/Noumea",
        "Fiji"                         => "Pacific/Fiji",
        "Kamchatka"                    => "Asia/Kamchatka",
        "Marshall Is."                 => "Pacific/Majuro",
        "Auckland"                     => "Pacific/Auckland",
        "Wellington"                   => "Pacific/Auckland",
        "Nuku'alofa"                   => "Pacific/Tongatapu"
      }.each { |name, zone| name.freeze; zone.freeze }
      MAPPING.freeze
    end

    UTC_OFFSET_WITH_COLON = '%+03d:%02d'
    UTC_OFFSET_WITHOUT_COLON = UTC_OFFSET_WITH_COLON.sub(':', '')

    def self.seconds_to_utc_offset(seconds, colon = true)
      format = colon ? UTC_OFFSET_WITH_COLON : UTC_OFFSET_WITHOUT_COLON
      hours = seconds / 3600
      minutes = (seconds.abs % 3600) / 60
      format % [hours, minutes]
    end

    include Comparable
    attr_reader :name

    def initialize(name, utc_offset, tzinfo = nil)
      @name = name
      @utc_offset = utc_offset
      @tzinfo = tzinfo
    end

    def utc_offset
      @utc_offset ||= tzinfo.current_period.utc_offset
    end

    def formatted_offset(colon=true, alternate_utc_string = nil)
      utc_offset == 0 && alternate_utc_string || self.class.seconds_to_utc_offset(utc_offset, colon)
    end

    def <=>(zone)
      result = (utc_offset <=> zone.utc_offset)
      result = (name <=> zone.name) if result == 0
      result
    end

    def =~(re)
      return true if name =~ re || MAPPING[name] =~ re
    end

    def to_s
      "(GMT#{formatted_offset}) #{name}"
    end

    def local(*args)
      time = TimeCrisis::Time.utc_time(*args)
      TimeCrisis::TimeWithZone.new(nil, self, time)
    end

    def at(secs)
      utc = TimeCrisis::Time.at(secs).utc rescue DateTime.civil(1970).since(secs)
      utc.in_time_zone(self)
    end

    def parse(str, now=now)
      date_parts = TimeCrisis::Date._parse(str)
      return if date_parts.blank?
      time = TimeCrisis::Time.parse(str, now) rescue TimeCrisis::DateTime.parse(str)
      if date_parts[:offset].nil?
        TimeCrisis::TimeWithZone.new(nil, self, time)
      else
        time.in_time_zone(self)
      end
    end

    def now
      TimeCrisis::Time.now.utc.in_time_zone(self)
    end

    def today
      tzinfo.now.to_tc_date
    end

    def utc_to_local(time)
      tzinfo.utc_to_local(time)
    end

    def local_to_utc(time, dst=true)
      tzinfo.local_to_utc(time, dst)
    end

    def period_for_utc(time)
      tzinfo.period_for_utc(time)
    end

    def period_for_local(time, dst=true)
      tzinfo.period_for_local(time, dst)
    end

    def tzinfo
      @tzinfo ||= ::TimeCrisis::TZInfo::Timezone.get(MAPPING[name])
    end

    unless const_defined?(:ZONES)
      ZONES = []
      ZONES_MAP = {}
      [[-39_600, "International Date Line West", "Midway Island", "Samoa" ],
        [-36_000, "Hawaii" ],
        [-32_400, "Alaska" ],
        [-28_800, "Pacific Time (US & Canada)", "Tijuana" ],
        [-25_200, "Mountain Time (US & Canada)", "Chihuahua", "Mazatlan",
          "Arizona" ],
        [-21_600, "Central Time (US & Canada)", "Saskatchewan", "Guadalajara",
          "Mexico City", "Monterrey", "Central America" ],
        [-18_000, "Eastern Time (US & Canada)", "Indiana (East)", "Bogota",
          "Lima", "Quito" ],
        [-16_200, "Caracas" ],
        [-14_400, "Atlantic Time (Canada)", "La Paz", "Santiago" ],
        [-12_600, "Newfoundland" ],
        [-10_800, "Brasilia", "Buenos Aires", "Georgetown", "Greenland" ],
        [ -7_200, "Mid-Atlantic" ],
        [ -3_600, "Azores", "Cape Verde Is." ],
        [      0, "Dublin", "Edinburgh", "Lisbon", "London", "Casablanca",
          "Monrovia", "UTC" ],
        [  3_600, "Belgrade", "Bratislava", "Budapest", "Ljubljana", "Prague",
          "Sarajevo", "Skopje", "Warsaw", "Zagreb", "Brussels",
          "Copenhagen", "Madrid", "Paris", "Amsterdam", "Berlin",
          "Bern", "Rome", "Stockholm", "Vienna",
          "West Central Africa" ],
        [  7_200, "Bucharest", "Cairo", "Helsinki", "Kyiv", "Riga", "Sofia",
          "Tallinn", "Vilnius", "Athens", "Istanbul", "Minsk",
          "Jerusalem", "Harare", "Pretoria" ],
        [ 10_800, "Moscow", "St. Petersburg", "Volgograd", "Kuwait", "Riyadh",
          "Nairobi", "Baghdad" ],
        [ 12_600, "Tehran" ],
        [ 14_400, "Abu Dhabi", "Muscat", "Baku", "Tbilisi", "Yerevan" ],
        [ 16_200, "Kabul" ],
        [ 18_000, "Ekaterinburg", "Islamabad", "Karachi", "Tashkent" ],
        [ 19_800, "Chennai", "Kolkata", "Mumbai", "New Delhi", "Sri Jayawardenepura" ],
        [ 20_700, "Kathmandu" ],
        [ 21_600, "Astana", "Dhaka", "Almaty",
          "Novosibirsk" ],
        [ 23_400, "Rangoon" ],
        [ 25_200, "Bangkok", "Hanoi", "Jakarta", "Krasnoyarsk" ],
        [ 28_800, "Beijing", "Chongqing", "Hong Kong", "Urumqi",
          "Kuala Lumpur", "Singapore", "Taipei", "Perth", "Irkutsk",
          "Ulaan Bataar" ],
        [ 32_400, "Seoul", "Osaka", "Sapporo", "Tokyo", "Yakutsk" ],
        [ 34_200, "Darwin", "Adelaide" ],
        [ 36_000, "Canberra", "Melbourne", "Sydney", "Brisbane", "Hobart",
          "Vladivostok", "Guam", "Port Moresby" ],
        [ 39_600, "Magadan", "Solomon Is.", "New Caledonia" ],
        [ 43_200, "Fiji", "Kamchatka", "Marshall Is.", "Auckland",
          "Wellington" ],
        [ 46_800, "Nuku'alofa" ]].
        each do |offset, *places|
        places.sort.each do |place|
          place.freeze
          zone = new(place, offset)
          ZONES << zone
          ZONES_MAP[place] = zone
        end
      end
      ZONES.freeze
      ZONES_MAP.freeze

      US_ZONES = ZONES.find_all { |z| z.name =~ /US|Arizona|Indiana|Hawaii|Alaska/ }
      US_ZONES.freeze
    end

    class << self
      alias_method :create, :new

      def new(name)
        self[name]
      end

      def all
        ZONES
      end

      def [](arg)
        case arg
        when String
          ZONES_MAP[arg]
        when Numeric, TimeCrisis::Duration
          arg *= 3600 if arg.abs <= 13
          all.find { |z| z.utc_offset == arg.to_i }
        else
          raise ArgumentError, "invalid argument to TimeZone[]: #{arg.inspect}"
        end
      end

      def us_zones
        US_ZONES
      end
    end
  end
end
