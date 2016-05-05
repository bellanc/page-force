module PageForce
  class Config
    class << self
      attr_reader :sfdc_tooling_client, :sfdc_api_client, :sobject_descriptions

      def establish_connection(connection_args)
        @sfdc_api_client ||= Restforce.new connection_args
      end

      def sfdc_api_client=(sfdc_api_client)
        if sfdc_api_client.instance_of?(Restforce::Data::Client)
          @sfdc_api_client = sfdc_api_client
        else
          raise InvalidAPIClientException
        end
      end
    end
  end
end

class InvalidToolingClientException

  def message
    "sfdc_tooling_client must be set to an instance of ActiveForce::Tooling::Client"
  end

end

class InvalidAPIClientException

  def message
    "sfdc_tooling_client must be set to an instance of ActiveForce::Data::Client"
  end

end