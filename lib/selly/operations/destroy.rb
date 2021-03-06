require 'http'

module Selly
  module Operations
    module Destroy
      def destroy(resource_id, params = {})
        response = HTTP.delete("#{API_ROOT}#{resource_url}/#{resource_id}", headers: Selly.request_headers, json: params)

        parsed = response.parse
        if parsed.class == Hash && (response.code < 200 || response.code > 300)
          raise SellyError.new(parsed['errors']), parsed['message']
        end

        parsed
      end
    end
  end
end