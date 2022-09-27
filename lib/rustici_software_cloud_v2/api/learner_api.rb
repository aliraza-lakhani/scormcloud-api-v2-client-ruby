=begin
#SCORM Cloud Rest API

#REST API used for SCORM Cloud integrations.

OpenAPI spec version: 2.0

Generated by: https://github.com/swagger-api/swagger-codegen.git
Swagger Codegen version: 2.4.27

=end

require 'uri'

module RusticiSoftwareCloudV2
  class LearnerApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # Deletes all PII for a learnerId 
    # Deletes all of the PII information for the learner.  This is meant for use with complying with GDPR requests from learners.  >**Note:** >This method is asynchronous.  A returned success status indicates a background process has been started, but there will still be a delay before the deletion of PII information takes place. 
    # @param learner_id The id of the learner
    # @param user_email The email of the user initiating this request on behalf of the learner being deleted. This must be a valid primary email address for a SCORM Cloud realm which this application is in. 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_all_learner_data(learner_id, user_email, opts = {})
      delete_all_learner_data_with_http_info(learner_id, user_email, opts)
      nil
    end

    # Deletes all PII for a learnerId 
    # Deletes all of the PII information for the learner.  This is meant for use with complying with GDPR requests from learners.  &gt;**Note:** &gt;This method is asynchronous.  A returned success status indicates a background process has been started, but there will still be a delay before the deletion of PII information takes place. 
    # @param learner_id The id of the learner
    # @param user_email The email of the user initiating this request on behalf of the learner being deleted. This must be a valid primary email address for a SCORM Cloud realm which this application is in. 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_all_learner_data_with_http_info(learner_id, user_email, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: LearnerApi.delete_all_learner_data ...'
      end
      # verify the required parameter 'learner_id' is set
      if learner_id.nil?
        fail ArgumentError, "Missing the required parameter 'learner_id' when calling LearnerApi.delete_all_learner_data"
      end
      # verify the required parameter 'user_email' is set
      if user_email.nil?
        fail ArgumentError, "Missing the required parameter 'user_email' when calling LearnerApi.delete_all_learner_data"
      end
      # resource path
      local_var_path = '/learner/{learnerId}/delete-information'.sub('{' + 'learnerId' + '}', learner_id.to_s)

      # query parameters
      query_params = {}
      query_params[:'userEmail'] = user_email

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['APP_NORMAL', 'OAUTH']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LearnerApi#delete_all_learner_data\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Delete tags from a learnerId 
    # Delete the specified tags from the learner.  Deleting tags that do not exist will still result in a success. 
    # @param learner_id The id of the learner
    # @param tags 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def delete_learner_tags(learner_id, tags, opts = {})
      delete_learner_tags_with_http_info(learner_id, tags, opts)
      nil
    end

    # Delete tags from a learnerId 
    # Delete the specified tags from the learner.  Deleting tags that do not exist will still result in a success. 
    # @param learner_id The id of the learner
    # @param tags 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def delete_learner_tags_with_http_info(learner_id, tags, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: LearnerApi.delete_learner_tags ...'
      end
      # verify the required parameter 'learner_id' is set
      if learner_id.nil?
        fail ArgumentError, "Missing the required parameter 'learner_id' when calling LearnerApi.delete_learner_tags"
      end
      # verify the required parameter 'tags' is set
      if tags.nil?
        fail ArgumentError, "Missing the required parameter 'tags' when calling LearnerApi.delete_learner_tags"
      end
      # resource path
      local_var_path = '/learner/{learnerId}/tags'.sub('{' + 'learnerId' + '}', learner_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(tags)
      auth_names = ['APP_NORMAL', 'OAUTH']
      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LearnerApi#delete_learner_tags\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Get tags for a learnerId 
    # Returns the tags for the learner. 
    # @param learner_id The id of the learner
    # @param [Hash] opts the optional parameters
    # @return [TagListSchema]
    def get_learner_tags(learner_id, opts = {})
      data, _status_code, _headers = get_learner_tags_with_http_info(learner_id, opts)
      data
    end

    # Get tags for a learnerId 
    # Returns the tags for the learner. 
    # @param learner_id The id of the learner
    # @param [Hash] opts the optional parameters
    # @return [Array<(TagListSchema, Fixnum, Hash)>] TagListSchema data, response status code and response headers
    def get_learner_tags_with_http_info(learner_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: LearnerApi.get_learner_tags ...'
      end
      # verify the required parameter 'learner_id' is set
      if learner_id.nil?
        fail ArgumentError, "Missing the required parameter 'learner_id' when calling LearnerApi.get_learner_tags"
      end
      # resource path
      local_var_path = '/learner/{learnerId}/tags'.sub('{' + 'learnerId' + '}', learner_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = nil
      auth_names = ['APP_NORMAL', 'OAUTH']
      data, status_code, headers = @api_client.call_api(:GET, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => 'TagListSchema')
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LearnerApi#get_learner_tags\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Add tags to a learnerId 
    # Applies the provided tags to the learner.  Tags are used to easily identify resources.  Adding tags can enable more refined searches when working with Reportage. 
    # @param learner_id The id of the learner
    # @param tags 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def put_learner_tags(learner_id, tags, opts = {})
      put_learner_tags_with_http_info(learner_id, tags, opts)
      nil
    end

    # Add tags to a learnerId 
    # Applies the provided tags to the learner.  Tags are used to easily identify resources.  Adding tags can enable more refined searches when working with Reportage. 
    # @param learner_id The id of the learner
    # @param tags 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def put_learner_tags_with_http_info(learner_id, tags, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: LearnerApi.put_learner_tags ...'
      end
      # verify the required parameter 'learner_id' is set
      if learner_id.nil?
        fail ArgumentError, "Missing the required parameter 'learner_id' when calling LearnerApi.put_learner_tags"
      end
      # verify the required parameter 'tags' is set
      if tags.nil?
        fail ArgumentError, "Missing the required parameter 'tags' when calling LearnerApi.put_learner_tags"
      end
      # resource path
      local_var_path = '/learner/{learnerId}/tags'.sub('{' + 'learnerId' + '}', learner_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(tags)
      auth_names = ['APP_NORMAL', 'OAUTH']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LearnerApi#put_learner_tags\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Add a group of tags to a group of learnerIds 
    # Applies all of the provided tags on all of the provided learners.  Tags are used to easily identify resources. Adding tags can enable more refined searches when working with Reportage. 
    # @param batch Array of ids, and array of tags for bulk tag operations
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def put_learner_tags_batch(batch, opts = {})
      put_learner_tags_batch_with_http_info(batch, opts)
      nil
    end

    # Add a group of tags to a group of learnerIds 
    # Applies all of the provided tags on all of the provided learners.  Tags are used to easily identify resources. Adding tags can enable more refined searches when working with Reportage. 
    # @param batch Array of ids, and array of tags for bulk tag operations
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def put_learner_tags_batch_with_http_info(batch, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: LearnerApi.put_learner_tags_batch ...'
      end
      # verify the required parameter 'batch' is set
      if batch.nil?
        fail ArgumentError, "Missing the required parameter 'batch' when calling LearnerApi.put_learner_tags_batch"
      end
      # resource path
      local_var_path = '/learner/tags'

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(batch)
      auth_names = ['APP_NORMAL', 'OAUTH']
      data, status_code, headers = @api_client.call_api(:PUT, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LearnerApi#put_learner_tags_batch\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
    # Update all Registrations for a learnerId 
    # Updates information about a group of registrations, such as learner email and name.  A learner in SCORM Cloud is not an entity on its own.  In fact, learners only exist as information on individual registrations.  This method will update the information on each of the registrations that the provided `learnerId` is attached to.  >**Caution:** >Providing an empty string will cause the value in SCORM Cloud to be set to empty.  This may have unintended consequences with regards to functionality.  >**Note:** >This method is asynchronous.  A returned success status indicates a background process has been started, but there will still be a delay before the changes on the registrations take place. 
    # @param learner_id The id of the learner
    # @param learner_info 
    # @param [Hash] opts the optional parameters
    # @return [nil]
    def update_learner_info(learner_id, learner_info, opts = {})
      update_learner_info_with_http_info(learner_id, learner_info, opts)
      nil
    end

    # Update all Registrations for a learnerId 
    # Updates information about a group of registrations, such as learner email and name.  A learner in SCORM Cloud is not an entity on its own.  In fact, learners only exist as information on individual registrations.  This method will update the information on each of the registrations that the provided &#x60;learnerId&#x60; is attached to.  &gt;**Caution:** &gt;Providing an empty string will cause the value in SCORM Cloud to be set to empty.  This may have unintended consequences with regards to functionality.  &gt;**Note:** &gt;This method is asynchronous.  A returned success status indicates a background process has been started, but there will still be a delay before the changes on the registrations take place. 
    # @param learner_id The id of the learner
    # @param learner_info 
    # @param [Hash] opts the optional parameters
    # @return [Array<(nil, Fixnum, Hash)>] nil, response status code and response headers
    def update_learner_info_with_http_info(learner_id, learner_info, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: LearnerApi.update_learner_info ...'
      end
      # verify the required parameter 'learner_id' is set
      if learner_id.nil?
        fail ArgumentError, "Missing the required parameter 'learner_id' when calling LearnerApi.update_learner_info"
      end
      # verify the required parameter 'learner_info' is set
      if learner_info.nil?
        fail ArgumentError, "Missing the required parameter 'learner_info' when calling LearnerApi.update_learner_info"
      end
      # resource path
      local_var_path = '/learner/{learnerId}/updateInfo'.sub('{' + 'learnerId' + '}', learner_id.to_s)

      # query parameters
      query_params = {}

      # header parameters
      header_params = {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      header_params['Content-Type'] = @api_client.select_header_content_type(['application/json'])

      # form parameters
      form_params = {}

      # http body (model)
      post_body = @api_client.object_to_http_body(learner_info)
      auth_names = ['APP_NORMAL', 'OAUTH']
      data, status_code, headers = @api_client.call_api(:POST, local_var_path,
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: LearnerApi#update_learner_info\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
