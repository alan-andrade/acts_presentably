require 'active_record'
require 'acts_presentably/version'

module ActsPresentably
  def acts_as_presentable
    include InstanceMethods
  end
  module InstanceMethods
    def presentable?
      true
    end
    def presenter_class
      self.class.name + 'Presenter'
    end
    def presenter_key
      (self.class.name.underscore.downcase + '_presenter').to_sym
    end
    def as_json(options={})
      if options && options.has_key?(presenter_key)
        options[presenter_key].new(self).as_json(options)
      else
        Kernel.const_get(presenter_class).new(self).as_json(options)
      end
    end
  end
end

ActiveRecord::Base.extend ActsPresentably