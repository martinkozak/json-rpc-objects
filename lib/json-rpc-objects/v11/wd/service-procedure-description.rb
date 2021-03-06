# encoding: utf-8
# (c) 2011-2015 Martin Poljak (martin@poljak.cz)

require "addressable/uri"
require "json-rpc-objects/v11/wd/procedure-parameter-description"
require "json-rpc-objects/generic"

##
# Main JSON-RPC Objects module.
#

module JsonRpcObjects

    ##
    # General module of JSON-RPC 1.1.
    #

    module V11
        
        ##
        # Module of JSON-RPC 1.1 Working Draft.
        # @see http://json-rpc.org/wd/JSON-RPC-1-1-WD-20060807.html
        #
        
        module WD
                
            ##
            # Description of one procedure of the service.
            #
            
            class ServiceProcedureDescription < JsonRpcObjects::Generic::Object
            
                ##
                # Holds link to its version module.
                #
                
                VERSION = JsonRpcObjects::V11::WD
                
                ##
                # Indicates the procedure parameter description class.
                #
                
                PARAMETER_DESCRIPTION_CLASS = JsonRpcObjects::V11::WD::ProcedureParameterDescription
                
                ##
                # Holds procedure name.
                # @return [Symbol]
                #
                
                attr_accessor :name
                @name
                
                ##
                # Holds procedure summary.
                # @return [String]
                #
                
                attr_accessor :summary
                @summary
                
                ##
                # Holds procedure help URL.
                # @return [Addressable::URI]
                #
                
                attr_accessor :url
                @help
                
                ##
                # Indicates procedure idempotency.
                # @return [Boolean]
                #
                
                attr_accessor :idempotent
                @idempotent
                
                ##
                # Holds procedure params specification.
                # @return [Array]
                #
                
                attr_accessor :params
                @params
                
                ##
                # Holds procedure return value specification.
                # @return [Class]
                #
                
                attr_accessor :return
                @return

                ##
                # Creates new one.
                #
                # @param [Symbol] name name of the procedure
                # @param [Hash] opts additional options
                # @return [V11:ServiceProcedureDescription] new description object
                #
                
                def self.create(name, opts = { })
                    data = { :name => name }
                    data.merge! opts
                    return self::new(data)
                end
                
                ##
                # Checks correctness of the data.
                #
                
                def check!
                    self.normalize!
                    
                    if not @name.kind_of? Symbol
                        raise Exception::new("Procedure name must be Symbol or convertable to Symbol.")
                    end

                    if not @params.nil? 
                        if (not @params.kind_of? Array) or (not @params.all? { |v| v.kind_of? self.class::PARAMETER_DESCRIPTION_CLASS })
                            raise Exception::new("If params is defined, must be an Array of " << self.class::PARAMETER_DESCRIPTION_CLASS.name << " objects.")
                        end
                        
                        if @params.kind_of? Array
                            @params.each { |param| param.check! }
                        end
                    end
                    
                    if not @return.nil?
                        if not @return.kind_of? self.class::PARAMETER_DESCRIPTION_CLASS
                            raise Exception::new("If return is defined, must be set to " << self.class::PARAMETER_DESCRIPTION_CLASS.name << " object.")
                        end
                        
                        @return.check!
                    end

                    if (not @idempotent.nil?) and (not Utils::Object.boolean? @idempotent)
                        raise Exception::new("If idempotent is defined, must be boolean.")
                    end
                end
                
                ##
                # Renders data to output hash.
                # @return [Hash] with data of description
                #
                
                def output
                    self.check!
                    data = { "name" => @name.to_s }
                    
                    if not @summary.nil?
                        data["summary"] = @summary
                    end
                    
                    if not @help.nil?
                        data["help"] = @help.to_s
                    end
                    
                    if not @idempotent.nil?
                        data["idempotent"] = @idempotent
                    end
                    
                    if not @params.nil?
                        data["params"] = @params.map { |i| i.output }
                    end

                    if not @return.nil?
                        data["return"] = @return.output
                    end
                    
                    return data
                end
                
                ##
                # Receives service procedure description objects.
                #
                # @param [ProcedureParameterDescription] value with new 
                #   service procedure descriptor
                #
                
                def <<(value)
                    if not value.kind_of? self.class::PARAMETER_DESCRIPTION_CLASS
                        raise Exception::new(self.class::PARAMETER_DESCRIPTION_CLASS.name.dup << " object expected.")
                    end
                    
                    if @params.nil?
                        @params = [ ]
                    end
                    
                    @params << value
                end
                                    
                    
                protected
                
                ##
                # Assigns request data.
                #
                
                def data=(value, mode = nil)            
                    data = __convert_data(value, mode)
                    
                    @name = data[:name]
                    @summary = data[:summary]
                    @help = data[:help]
                    @idempotent = data[:idempotent]
                    @params = data[:params]
                    @return = data[:return]
                    
                    if @params.kind_of? Array
                        @params = @params.map { |v| self.class::PARAMETER_DESCRIPTION_CLASS::new(v) }
                    end
                    
                    if @return.kind_of? Hash
                        @return = self.class::PARAMETER_DESCRIPTION_CLASS::new(@return)
                    end
                end
                
                ##
                # Converts request data to standard (defined) format.
                #
                
                def normalize!
                    if @name.kind_of? String
                        @name = @name.to_sym
                    end
                    
                    if not @summary.nil?
                        @summary = @summary.to_s
                    end
                    
                    if (not @help.nil?) and (not @help.kind_of? Addressable::URI)
                        @help = Addressable::URI::parse(@help.to_s)
                    end
                end

            end
        end
    end
end
