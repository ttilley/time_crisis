module TimeCrisis
  Time = ::Time.dup
end

if defined?(::ActiveSupport)
  module TimeCrisis
    class Time
      #======================================================================>
      # try to get back original versions of methods
      
      if instance_methods.include?('plus_without_duration')
        alias :+ :plus_without_duration
        undef :plus_without_duration
        undef :plus_with_duration
      end
      
      if instance_methods.include?('minus_without_duration')
        alias :- :minus_without_duration
        undef :minus_without_duration
        undef :minus_with_duration
      end
      
      if instance_methods.include?('minus_without_coercion')
        undef :minus_without_coercion
        undef :minus_with_coercion
      end
      
      if instance_methods.include?('compare_without_coercion')
        alias :<=> :compare_without_coercion
        undef :compare_without_coercion
        undef :compare_with_coercion
      end
      
      if instance_methods.include?('default_inspect')
        alias :inspect :default_inspect
        undef :default_inspect
        undef :readable_inspect
      end
      
      class << self
        if respond_to?(:_original_load)
          alias :_load :_original_load
          undef :_original_load
        end
        
        if respond_to?(:_original_dump)
          alias :_dump :_original_dump
          undef :_original_dump
        end
      end
      
      #======================================================================>
      
      class << self
        [
          :zone_default, :zone_default=, :zone, :zone=,
          :use_zone, :current, :get_zone
        ].each {|method| undef_method(method) if respond_to?(method)}
      end
      
      undef :in_time_zone if instance_methods.include?('in_time_zone')
      
    end
  end
end
