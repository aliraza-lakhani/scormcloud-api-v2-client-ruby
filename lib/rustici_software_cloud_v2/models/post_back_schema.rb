=begin
#SCORM Cloud Rest API

#REST API used for SCORM Cloud integrations.

OpenAPI spec version: 2.0

Generated by: https://github.com/swagger-api/swagger-codegen.git

=end

require 'date'


module RusticiSoftwareCloudV2
  class PostBackSchema
    attr_accessor :url

    # Optional parameter to specify how to authorize against the given postbackurl, can be 'form' or 'httpbasic'. If form authentication, the username and password for authentication are submitted as form fields 'username' and 'password', and the registration data as the form field 'data'. If httpbasic authentication is used, the username and password are placed in the standard Authorization HTTP header, and the registration data is the body of the message (sent as text/xml content type). This field is set to 'form' by default.
    attr_accessor :auth_type

    # The user name to be used in authorizing the postback of data to the URL specified by postback url.
    attr_accessor :user_name

    # The password to be used in authorizing the postback of data to the URL specified by postback url.
    attr_accessor :password

    # This parameter allows you to specify a level of detail in the information that is posted back while the course is being taken. It may be one of three values: 'course' (course summary), 'activity' (activity summary, or 'full' (full detail), and is set to 'course' by default. The information will be posted as xml, and the format of that xml is specified below under the method 'getRegistrationResult'
    attr_accessor :results_format

    # This paramenter is ONLY used for backwards compatibility with XML postback implementations.  You probably shouldn't need to use this unless you're currently transitioning from the V1 api to the V2 api and already have existing XML postback logic in your application, but have not yet built out JSON postback logic.  If a registration is created with the V2 api we will assume that you're expecting JSON results unless otherwise specified. 
    attr_accessor :legacy

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'url' => :'url',
        :'auth_type' => :'authType',
        :'user_name' => :'userName',
        :'password' => :'password',
        :'results_format' => :'resultsFormat',
        :'legacy' => :'legacy'
      }
    end

    # Attribute type mapping.
    def self.swagger_types
      {
        :'url' => :'String',
        :'auth_type' => :'String',
        :'user_name' => :'String',
        :'password' => :'String',
        :'results_format' => :'String',
        :'legacy' => :'BOOLEAN'
      }
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      return unless attributes.is_a?(Hash)

      # convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h| h[k.to_sym] = v }

      if attributes.has_key?(:'url')
        self.url = attributes[:'url']
      end

      if attributes.has_key?(:'authType')
        self.auth_type = attributes[:'authType']
      else
        self.auth_type = 'UNDEFINED'
      end

      if attributes.has_key?(:'userName')
        self.user_name = attributes[:'userName']
      end

      if attributes.has_key?(:'password')
        self.password = attributes[:'password']
      end

      if attributes.has_key?(:'resultsFormat')
        self.results_format = attributes[:'resultsFormat']
      else
        self.results_format = 'UNDEFINED'
      end

      if attributes.has_key?(:'legacy')
        self.legacy = attributes[:'legacy']
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

    # Custom attribute writer method checking allowed values (enum).
    #
    # allowable_values = ['UNDEFINED', 'FORM', 'HTTPBASIC']
    #
    # @param [Object] auth_type Object to be assigned
    def auth_type=(auth_type)
      @auth_type = auth_type
    end
    # Custom attribute writer method checking allowed values (enum).
    #
    # allowable_values = ['UNDEFINED', 'COURSE', 'ACTIVITY', 'FULL']
    #
    # @param [Object] results_format Object to be assigned
    def results_format=(results_format)
      @results_format = results_format
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          url == o.url &&
          auth_type == o.auth_type &&
          user_name == o.user_name &&
          password == o.password &&
          results_format == o.results_format &&
          legacy == o.legacy
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Fixnum] Hash code
    def hash
      [url, auth_type, user_name, password, results_format, legacy].hash
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
