require "acts_as_presentable/version"

module ActsAsPresentable
  
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def acts_as_presentable(options = {})
      unless presentable?
        def presenter_class
          self.class.name + 'Presenter'
        end
        def presenter_key
          self.class.name.underscore.downcase + '_presenter'.to_sym
        end
      end
      include InstanceMethods
    end
    def presentable?
      self.included_modules.include?(InstanceMethods)
    end
  end
  
  module InstanceMethods
    def self.included(base)
      base.extend ClassMethods
    end
    module ClassMethods
      def as_json(options={})
        if options && options.has_key?(presenter_key)
          options[presenter_key].new(self).as_json(options)
        else
          presenter_class.new(self).as_json(options)
        end
      end
    end
  end
  
end
