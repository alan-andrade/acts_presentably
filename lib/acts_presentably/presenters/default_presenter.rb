module ActsPresentably
  module Presenters
    class DefaultPresenter
      def self.fields(*fields)
        if fields.any?
          @fields = fields
        else
          @fields
        end
      end

      def self.associations(*associations)
        associations.any? ? (@associations = associations) : @associations
      end

      def self.parse_options(attributes)
        attributes.collect do |attribute_or_options|
          case attribute_or_options
          when Hash
            key = attribute_or_options[:key]
            display_as = attribute_or_options[:display_as]
          else
            key = attribute_or_options
            display_as = attribute_or_options
          end
          {:key => key, :display_as => display_as}
        end
      end


      def initialize object
        @object = object
      end

      def fields
        self.class.fields || [:id]
      end

      def associations
        self.class.associations || []
      end

      def as_json(options={})
        @options = options
        add_root(include_related_in build_hash)
      end

      def include_root
        unless defined?(@include_root)
          @include_root = @options[:include_root] || @object.respond_to?(:include_root_in_json) && @object.include_root_in_json
        end
        @include_root
      end

      def add_root(hash)
         if include_root
           custom_root = @options && @options[:root]
           hash = { custom_root || @object.class.model_name.element => hash }
         end
         hash
      end

      def object_name
        @object.class.name
      end

      def build_hash
        hash = {}
        fields.each do |field|
          hash[field] = @object.send field
        end
        hash
      end

      def include_related_in hash
        hash.tap do |hash|
          associations.each do |assoc|
            hash[assoc] = @object.send(assoc).as_json(@options)
          end
        end
      end

      def self.as_json_using object, options, presenter_key
        if options && options.has_key?(presenter_key)
           options[presenter_key].new(object).as_json(options)
         else
           self.new(object).as_json(options)
         end
      end
    end
  end
end