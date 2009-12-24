module TimeCrisis
  class Time
    %w(to_date to_datetime).each do |method|
      if private_instance_methods.include?(method) || private_instance_methods.include?(method.to_sym)
        public method
      end
    end
  end
end