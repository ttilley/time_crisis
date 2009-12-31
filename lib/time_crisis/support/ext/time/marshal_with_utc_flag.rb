if RUBY_VERSION < '1.9'
  module TimeCrisis
    class Time
      class << self
        if respond_to?(:_original_load)
          undef_method :_load
          alias_method :_load, :_original_load
        end
        
        alias_method :_original_load, :_load
        def _load(marshaled_time)
          time = _original_load(marshaled_time)
          utc = time.instance_variable_get('@marshal_with_utc_coercion')
          utc ? time.utc : time
        end
      end
      
      if respond_to?(:_original_dump)
        undef_method :_dump
        alias_method :_dump, :_original_dump
      end

      alias_method :_original_dump, :_dump
      def _dump(*args)
        obj = frozen? ? dup : self
        obj.instance_variable_set('@marshal_with_utc_coercion', utc?)
        obj._original_dump(*args)
      end
    end
  end
end
