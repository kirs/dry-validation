module Dry
  module Validation
    class InputProcessorCompiler::Sanitizer < InputProcessorCompiler
      PREDICATE_MAP = {
        default: 'string',
        none?: 'nil',
        bool?: 'bool',
        str?: 'string',
        int?: 'int',
        float?: 'float',
        decimal?: 'decimal',
        date?: 'date',
        date_time?: 'date_time',
        time?: 'time',
        hash?: 'hash',
        array?: 'array'
      }.freeze

      CONST_MAP = {
        NilClass => 'nil',
        String => 'string',
        Fixnum => 'int',
        Integer => 'int',
        Float => 'float',
        BigDecimal => 'decimal',
        Array => 'array',
        Hash => 'hash',
        Date => 'date',
        DateTime => 'date_time',
        Time => 'time',
        TrueClass => 'true',
        FalseClass => 'false'
      }.freeze

      def identifier
        :sanitizer
      end

      def hash_node(schema)
        [:type, ['hash', [:weak, schema]]]
      end

      def array_node(members)
        [:type, ['array', members]]
      end
    end
  end
end
