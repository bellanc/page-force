module PageForce
  class Config
    class << self
      attr_reader :sfdc_tooling_client

      def establish_connection(connection_args)
        @sfdc_tooling_client ||= Restforce.tooling connection_args
      end

      def sfdc_tooling_client=(sfdc_tooling_client)
        if sfdc_tooling_client.instance_of?(Restforce::Tooling::Client)
          @sfdc_tooling_client = sfdc_tooling_client
        else
          raise InvalidToolingClientException
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