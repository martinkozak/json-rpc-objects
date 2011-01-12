# encoding: utf-8
require "json-rpc-objects/v11/alt/procedure-call"

##
# Main JSON-RPC Objects module.
#

module JsonRpcObjects

    ##
    # General module of JSON-RPC 1.1.
    #

    module V11
        
        ##
        # Module of JSON-RPC 1.1 Alternative.
        # @see http://groups.google.com/group/json-rpc/web/json-rpc-1-1-alt
        #
        
        module WD
                
            ##
            # Fake procedure call (request) class.
            #
            
            class Request < JsonRpcObjects::V11::Alt::ProcedureCall
            end
            
        end
    end
end

