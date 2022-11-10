=begin
#SCORM Cloud Rest API

#REST API used for SCORM Cloud integrations.

OpenAPI spec version: 2.0

Generated by: https://github.com/swagger-api/swagger-codegen.git

=end

require 'date'


module RusticiSoftwareCloudV2
  # https://github.com/adlnet/xAPI-Spec/blob/1.0.2/xAPI.md#41-statement-properties
  class XapiStatement
    attr_accessor :id

    attr_accessor :actor

    attr_accessor :verb

    attr_accessor :object_activity

    attr_accessor :object_agent_group

    attr_accessor :object_statement_reference

    attr_accessor :object_sub_statement

    attr_accessor :result

    attr_accessor :context

    attr_accessor :timestamp

    attr_accessor :stored

    attr_accessor :authority

    attr_accessor :attachments

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'id' => :'id',
        :'actor' => :'actor',
        :'verb' => :'verb',
        :'object_activity' => :'objectActivity',
        :'object_agent_group' => :'objectAgentGroup',
        :'object_statement_reference' => :'objectStatementReference',
        :'object_sub_statement' => :'objectSubStatement',
        :'result' => :'result',
        :'context' => :'context',
        :'timestamp' => :'timestamp',
        :'stored' => :'stored',
        :'authority' => :'authority',
        :'attachments' => :'attachments'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'id' => :'String',
        :'actor' => :'XapiAgentGroup',
        :'verb' => :'XapiVerb',
        :'object_activity' => :'XapiActivity',
        :'object_agent_group' => :'XapiAgentGroup',
        :'object_statement_reference' => :'XapiStatementReference',
        :'object_sub_statement' => :'XapiStatement',
        :'result' => :'XapiResult',
        :'context' => :'XapiContext',
        :'timestamp' => :'DateTime',
        :'stored' => :'DateTime',
        :'authority' => :'XapiAgentGroup',
        :'attachments' => :'Array<XapiAttachment>'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.has_key?(:'actor')
        self.actor = attributes[:'actor']
      end

      if attributes.has_key?(:'verb')
        self.verb = attributes[:'verb']
      end

      if attributes.has_key?(:'objectActivity')
        self.object_activity = attributes[:'objectActivity']
      end

      if attributes.has_key?(:'objectAgentGroup')
        self.object_agent_group = attributes[:'objectAgentGroup']
      end

      if attributes.has_key?(:'objectStatementReference')
        self.object_statement_reference = attributes[:'objectStatementReference']
      end

      if attributes.has_key?(:'objectSubStatement')
        self.object_sub_statement = attributes[:'objectSubStatement']
      end

      if attributes.has_key?(:'result')
        self.result = attributes[:'result']
      end

      if attributes.has_key?(:'context')
        self.context = attributes[:'context']
      end

      if attributes.has_key?(:'timestamp')
        self.timestamp = attributes[:'timestamp']
      end

      if attributes.has_key?(:'stored')
        self.stored = attributes[:'stored']
      end

      if attributes.has_key?(:'authority')
        self.authority = attributes[:'authority']
      end

      if attributes.has_key?(:'attachments')
        if (value = attributes[:'attachments']).is_a?(Array)
          self.attachments = value
        end
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      true
    end


    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          id == o.id &&
          actor == o.actor &&
          verb == o.verb &&
          object_activity == o.object_activity &&
          object_agent_group == o.object_agent_group &&
          object_statement_reference == o.object_statement_reference &&
          object_sub_statement == o.object_sub_statement &&
          result == o.result &&
          context == o.context &&
          timestamp == o.timestamp &&
          stored == o.stored &&
          authority == o.authority &&
          attachments == o.attachments
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [id, actor, verb, object_activity, object_agent_group, object_statement_reference, object_sub_statement, result, context, timestamp, stored, authority, attachments].hash
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      self.class.swagger_types.each_pair do |key, type|
        if type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) })
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]]))
        end # or else data not found in attributes(hash), not an issue as the data can be optional
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :DateTime
        DateTime.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :BOOLEAN
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        temp_model = RusticiSoftwareCloudV2.const_get(type).new
        temp_model.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr)
        next if value.nil?
        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end
end
