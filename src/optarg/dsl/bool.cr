module Optarg
  class Model
    macro __define_bool_option(names, default = nil, not = %w())
      {%
        names = [names] unless names.class_name == "ArrayLiteral"
        method_names = names.map{|i| i.split("=")[0].gsub(/^-*/, "").gsub(/-/, "_")}
        not = [not] unless not.class_name == "ArrayLiteral"
      %}

      __define_hashed_value_container ::Bool
      __define_hashed_value_option ::Bool, ::Optarg::OptionMixins::Bool, {{names}}

      {% for method_name, index in method_names %}
        def {{method_name.id}}?
          !!@__options__bool[{{names[0]}}]?
        end
      {% end %}
    end

    macro __add_bool_option(names, metadata = nil, default = nil, not = %w())
      {%
        names = [names] unless names.class_name == "ArrayLiteral"
        method_names = names.map{|i| i.split("=")[0].gsub(/^-*/, "").gsub(/-/, "_")}
        not = [not] unless not.class_name == "ArrayLiteral"
        class_name = "Option_" + method_names[0]
      %}

      %option = Options::{{class_name.id}}.new({{names}}, metadata: {{metadata}}, default: {{default}}, not: {{not}})
      @@__self_options[%option.key] = %option
    end

    macro bool(names, metadata = nil, default = nil, not = %w())
      __define_bool_option {{names}}
      __add_bool_option {{names}}, metadata: {{metadata}}, default: {{default}}, not: {{not}}
    end
  end
end