module TimeCrisis
  if defined? ::BasicObject
    class BasicObject < ::BasicObject
      undef_method :==
      undef_method :equal?

      def raise(*args)
        ::Object.send(:raise, *args)
      end
    end
  else
    class BasicObject
      instance_methods.each do |m|
        undef_method(m) if m.to_s !~ /(?:^__|^nil\?$|^send$|^object_id$)/
      end
    end
  end
end
