class Object
  def acts_like?(duck)
    respond_to? :"acts_like_#{duck}?"
  end
end

module TimeCrisis::Support::ActsLike
  module Date
    def acts_like_date?
      true
    end
  end

  module DateTime
    def acts_like_date?
      true
    end

    def acts_like_time?
      true
    end
  end
end

::TimeCrisis::Date.send(:include, TimeCrisis::Support::ActsLike::Date)
::TimeCrisis::DateTime.send(:include, TimeCrisis::Support::ActsLike::DateTime)
