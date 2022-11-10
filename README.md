# rustici_software_cloud_v2

RusticiSoftwareCloudV2 - the Ruby gem for the SCORM Cloud Rest API

REST API used for SCORM Cloud integrations.

This SDK is automatically generated by the [Swagger Codegen](https://github.com/swagger-api/swagger-codegen) project:

- API version: 2.0
- Package version: 3.0.0
- Build package: io.swagger.codegen.languages.RubyClientCodegen

## Installation
### Gem
[rustici_software_cloud_v2](https://rubygems.org/gems/rustici_software_cloud_v2)

### Local:
Build the Ruby code into a gem:

```shell
gem build rustici_software_cloud_v2.gemspec
```

```shell
gem install ./rustici_software_cloud_v2-3.0.0.gem
```
For development, run `gem install --dev ./rustici_software_cloud_v2-3.0.0.gem` to install the development dependencies

Finally add this to the Gemfile:

    gem 'rustici_software_cloud_v2', '~> 3.0.0'

## Tips and Tricks
Working with headers will require calling the `WithHttpInfo` version of the function. This allows for grabbing the header directly from the response object:
```ruby
# Note: This code is specifically designed to not modify any existing data
dispatch_api = RusticiSoftwareCloudV2::DispatchApi.new
response = dispatch_api.update_dispatches_with_http_info(RusticiSoftwareCloudV2::UpdateDispatchSchema.new, {since: Time.now.strftime('%Y-%m-%dT%H:%M:%S.%L') + 'Z'})
puts response[2]["X-Total-Count"]
```

## Changelog:
Check the [changelog](https://cloud.scorm.com/docs/v2/reference/changelog/) for details of what has changed.

## Sample Code
```ruby
require 'rustici_software_cloud_v2'
require 'open-uri'
include RusticiSoftwareCloudV2


# ScormCloud API credentials
# Note: These are not the same credentials used to log in to ScormCloud
APP_ID = 'APP_ID'
SECRET_KEY = 'SECRET_KEY'

# Sample values for data
COURSE_PATH = '/PATH/TO/COURSE/RunTimeAdvancedCalls_SCORM20043rdEdition.zip'

COURSE_ID = 'RB_SAMPLE_COURSE'
LEARNER_ID = 'RB_SAMPLE_COURSE_LEARNER'
REGISTRATION_ID = 'RB_SAMPLE_COURSE_REGISTRATION'

# String used for output formatting
OUTPUT_BORDER = "---------------------------------------------------------\n\n"


# This sample will consist of:
# 1. Creating a course.
# 2. Registering a learner for the course.
# 3. Building a link for the learner to take the course.
# 4. Getting the learner's progress after having taken the course.
# 5. Viewing all courses and registrations.
# 6. Deleting all of the data created via this sample.
#
# All input variables used in this sample are defined up above.
def main()
    RusticiSoftwareCloudV2.configure do |config|
        # Configure HTTP basic authorization: APP_NORMAL
        config.username = APP_ID
        config.password = SECRET_KEY
    end

    sc = ScormCloud_Ruby_Sample.new

    begin
        # Create a course and a registration
        course_details = sc.create_course(COURSE_ID, COURSE_PATH)
        sc.create_registration(COURSE_ID, LEARNER_ID, REGISTRATION_ID)

        # Show details of the newly imported course
        puts 'Newly Imported Course Details: '
        puts course_details



        # Create the registration launch link
        launch_link = sc.build_launch_link(REGISTRATION_ID)

        # Show the launch link
        puts OUTPUT_BORDER
        puts "Launck Link: #{launch_link}"
        puts 'Navigate to the url above to take the course. Hit enter once complete.'
        gets



        # Get the results for the registration
        registration_progress = sc.get_result_for_registration(REGISTRATION_ID)

        # Show details of the registration progress
        puts OUTPUT_BORDER
        puts 'Registration Progress: '
        puts registration_progress



        # Get information about all the courses in ScormCloud
        course_list = sc.get_all_courses()

        # Show details of the courses
        puts OUTPUT_BORDER
        puts 'Course List: '
        course_list.each do |course|
            puts course
        end



        # Get information about all the registrations in ScormCloud
        registration_list = sc.get_all_registrations()

        # Show details of the registrations
        puts OUTPUT_BORDER
        puts 'Registration List: '
        registration_list.each do |registration|
            puts registration
        end

    rescue ApiError, ArgumentError => error
        puts error

    ensure
        # Delete all the data created by this sample
        sc.clean_up(COURSE_ID, REGISTRATION_ID)

    end
end

class ScormCloud_Ruby_Sample

    # Sets the default OAuth token passed with all calls to the API.
    #
    # If a token is created with limited scope (i.e. read:registration),
    # calls that require a different permission set will error. Either a
    # new token needs to be generated with the correct scope, or the
    # default access token can be reset to nil. This would cause the
    # request to be made with basic auth credentials (appId/ secret key)
    # instead.
    #
    # Additionally, you could create a new configuration object and set
    # the token on that object instead of the default access token. This
    # configuration would then be passed into the Api object:
    #
    # config = Configuration.new
    # token_request = TokenRequestSchema.new({
    #     permissions: PermissionsSchema.new({
    #         scopes: [ "write:course", "read:course" ]
    #     }),
    #     expiry: (Time.now + 2 * 60).iso8601
    # })
    # config.access_token = app_management_api.create_token(token_request).result
    # course_api = CourseApi.new(ApiClient.new(config))
    #
    # Any calls that would use this CourseApi instance would then have the
    # write:course and read:course permissions passed automatically, but
    # other instances would be unaffected and continue to use other means
    # of authorization.
    #
    # @param [Array<String>] :scopes List of permissions for calls made with the token.
    private def configure_oauth(scopes)
        app_management_api = ApplicationManagementApi.new

        # Set permissions and expiry time of the token
        # The expiry expected for token request must be in ISO-8601 format
        expiry = (Time.now + 2 * 60).iso8601
        permissions = PermissionsSchema.new({ scopes: scopes })

        # Make the request to get the OAuth token
        token_request = TokenRequestSchema.new({ permissions: permissions, expiry: expiry })
        token_result = app_management_api.create_token(token_request)

        # Set the default access token used with further API requests.
        # To remove the token, reset config.access_token back to nil
        # before the next call.
        RusticiSoftwareCloudV2.configure do |config|
            config.access_token = token_result.result
        end

        nil
    end

    # Creates a course by uploading the course from your local machine.
    # Courses are a package of content for a learner to consume.
    #
    # Other methods for importing a course exist. Check the documentation
    # for additional ways of importing a course.
    #
    # @param [String] :course_id Id that will be used to identify the course.
    # @param [String] :course_path Path to the course being uploaded.
    # @return [CourseSchema] Detailed information about the newly uploaded course.
    def create_course(course_id, course_path)
        # (Optional) Further authenticate via OAuth token access
        # configure_oauth([ "write:course", "read:course" ])

        # This call will use OAuth with the "write:course" scope
        # if configured.  Otherwise the basic auth credentials will be used
        course_api = CourseApi.new
        job_id = course_api.create_upload_and_import_course_job(course_id, { file: open(course_path) })

        # This call will use OAuth with the "read:course" scope
        # if configured.  Otherwise the basic auth credentials will be used
        job_result = course_api.get_import_job_status(job_id.result)
        while job_result.status == 'RUNNING'
            sleep(1)
            job_result = course_api.get_import_job_status(job_id.result)
        end

        if job_result.status == 'ERROR'
            raise ArgumentError.new('Course is not properly formatted: ' + job_result.message)
        end

        job_result.import_result.course
    end

    # Creates a registration allowing the learner to consume the course
    # content. A registration is the link between a learner and a single
    # course.
    #
    # @param [String] :course_id Id of the course to register the learner for.
    # @param [String] :learner_id Id that will be used to identify the learner.
    # @param [String] :registration_id Id that will be used to identify the registration.
    def create_registration(course_id, learner_id, registration_id)
        # (Optional) Further authenticate via OAuth token access
        # configure_oauth([ "write:registration" ])

        registration_api = RegistrationApi.new
        learner = LearnerSchema.new({ id: learner_id })
        registration = CreateRegistrationSchema.new({ courseId: course_id, learner: learner, registrationId: registration_id })
        registration_api.create_registration(registration)

        nil
    end

    # Builds a url allowing the learner to access the course.
    #
    # This sample will build the launch link and print it out. It will then
    # pause and wait for user input, allowing you to navigate to the course
    # to generate sample learner progress. Once this step has been reached,
    # hitting the enter key will continue program execution.
    #
    # @param [String] :registration_id Id of the registration the link is being built for.
    # @return [String] Link for the learner to launch the course.
    def build_launch_link(registration_id)
        # (Optional) Further authenticate via OAuth token access
        # configure_oauth([ "read:registration" ])

        registration_api = RegistrationApi.new
        settings = LaunchLinkRequestSchema.new({ redirectOnExitUrl: 'Message' })
        launch_link = registration_api.build_registration_launch_link(registration_id, settings)

        launch_link.launch_link
    end

    # Gets information about the progress of the registration.
    #
    # For the most up-to-date results, you should implement our postback
    # mechanism. The basic premise is that any update to the registration
    # would cause us to send the updated results to your system.
    #
    # More details can be found in the documentation:
    # https://cloud.scorm.com/docs/v2/guides/postback/
    #
    # @param [String] :registration_id Id of the registration to get results for.
    # @return [RegistrationSchema] Detailed information about the registration's progress.
    def get_result_for_registration(registration_id)
        # (Optional) Further authenticate via OAuth token access
        # configure_oauth([ "read:registration" ])

        registration_api = RegistrationApi.new
        progress = registration_api.get_registration_progress(registration_id)

        progress
    end

    # Gets information about all courses. The result received from the API
    # call is a paginated list, meaning that additional calls are required
    # to retrieve all the information from the API. This has already been
    # accounted for in the sample.
    #
    # @return [Array<CourseSchema>] List of detailed information about all of the courses.
    def get_all_courses()
        # (Optional) Further authenticate via OAuth token access
        # configure_oauth([ "read:course" ])

        # Additional filters can be provided to this call to get a subset
        # of all courses.
        course_api = CourseApi.new
        response = course_api.get_courses()

        # This call is paginated, with a token provided if more results exist
        course_list = response.courses
        until response.more.nil?
            response = course_api.get_courses({ more: response.more })
            course_list += response.courses
        end

        course_list
    end

    # Gets information about the registration progress for all
    # registrations. The result received from the API call is a paginated
    # list, meaning that additional calls are required to retrieve all the
    # information from the API. This has already been accounted for in the
    # sample.
    #
    # This call can be quite time-consuming and tedious with lots of
    # registrations. If you find yourself making lots of calls to this
    # endpoint, it might be worthwhile to look into registration postbacks.
    #
    # More details can be found in the documentation:
    # https://cloud.scorm.com/docs/v2/guides/postback/
    #
    # @return [Array<RegistrationSchema>] List of detailed information about all of the registrations.
    def get_all_registrations()
        # (Optional) Further authenticate via OAuth token access
        # configure_oauth([ "read:registration" ])

        # Additional filters can be provided to this call to get a subset
        # of all registrations.
        registration_api = RegistrationApi.new
        response = registration_api.get_registrations()

        # This call is paginated, with a token provided if more results exist
        registration_list = response.registrations
        until response.more.nil?
            response = registration_api.get_registrations({ more: response.more })
            registration_list += response.registrations
        end

        registration_list
    end

    # Deletes all of the data generated by this sample.
    # This code is run even if the program has errored out, providing a
    # "clean slate" for every run of this sample.
    #
    # It is not necessary to delete registrations if the course
    # they belong to has been deleted. Deleting the course will
    # automatically queue deletion of all registrations associated with
    # the course. There will be a delay between when the course is deleted
    # and when the registrations for the course have been removed. The
    # registration deletion has been handled here to prevent scenarios
    # where the registration hasn't been deleted yet by the time the
    # sample has been rerun.
    #
    # @param [String] :course_id Id of the course to delete.
    # @param [String] :registration_id Id of the registration to delete.
    def clean_up(course_id, registration_id)
        # (Optional) Further authenticate via OAuth token access
        # configure_oauth([ "delete:course", "delete:registration" ])

        # This call will use OAuth with the "delete:course" scope
        # if configured.  Otherwise the basic auth credentials will be used
        course_api = CourseApi.new
        course_api.delete_course(course_id)

        # The code below is to prevent race conditions if the
        # sample is run in quick successions.

        # This call will use OAuth with the "delete:registration" scope
        # if configured.  Otherwise the basic auth credentials will be used
        registration_api = RegistrationApi.new
        registration_api.delete_registration(registration_id)

        nil
    end
end

if __FILE__ == $0
    main
end

```
