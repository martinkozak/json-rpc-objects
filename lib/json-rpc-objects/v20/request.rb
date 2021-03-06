# encoding: utf-8
# (c) 2011-2015 Martin Poljak (martin@poljak.cz)

require "json-rpc-objects/v11/alt/request"
require "json-rpc-objects/utils"

##
# Main JSON-RPC Objects module.
#

module JsonRpcObjects

    ##
    # Module of JSON-RPC 2.0.
    # @see http://groups.google.com/group/json-rpc/web/json-rpc-2-0
    #

    module V20
    
        ##
        # Request object class.
        #
        
        class Request < JsonRpcObjects::V11::Alt::Request

            ##
            # Holds link to its version module.
            #
            
            VERSION = JsonRpcObjects::V20
            
            ##
            # Holds JSON-RPC version specification.
            #
            
            VERSION_NUMBER = "2.0"
            
            ##
            # Holds JSON-RPC version member identification.
            #
            
            VERSION_MEMBER = "jsonrpc"
                        
            ##
            # Indicates ID has been set.
            #
            
            @_id_set
        
            ##
            # Checks correctness of the request data.
            #
            
            def check!
                super()
                
                if not [Symbol, String, Integer, NilClass].any?{ |cl| @id.kind_of?(cl) }
                    raise Exception::new("ID must contain Symbol, String, Number or nil if included.")
                end
            end
            
            ##
            # Renders data to output hash.
            # @return [Hash] with data of error
            #
            
            def output
                result = super()
                
                if @_id_set and @id.nil?
                    result["id"] = nil
                end

                return result
            end

            ##
            # Indicates, it's notification.
            # @return [Boolean] true if it is, otherwise false
            #

            def notification?
                not @_id_set
            end
            
           
            
            protected
            
            ##
            # Assigns request data.
            #

            def data=(value, mode = nil)
                data = __convert_data(value, mode)
                
                # Indicates, ID has been explicitly assigned
                @_id_set = data.include? :id
                
                super(data, :converted)
            end          
            
            ##
            # Gets params from input.
            #
            
            def __get_params(data)
                if @params.kind_of?(Hash)
                    @keyword_params = Utils::Hash.keys_to_sym(@params)
                    @params = nil
                end
            end

            ##
            # Assigns the parameters settings.
            #
            
            def __assign_params(data, version = nil)
                if not @params.nil? and not @params.empty?
                    data[:params] = @params
                elsif not @keyword_params.nil? and not @keyword_params.empty?
                    data[:params] = Utils::Hash.map_keys(@keyword_params) { |k| k.to_s } 
                end
            end
            
        end
    end
end
