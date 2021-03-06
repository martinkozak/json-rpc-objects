# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-
# stub: json-rpc-objects 0.4.6 ruby lib

Gem::Specification.new do |s|
  s.name = "json-rpc-objects"
  s.version = "0.4.6"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Martin Poljak"]
  s.date = "2015-12-16"
  s.email = "martin@poljak.cz"
  s.extra_rdoc_files = [
    "LICENSE.txt",
    "README.md"
  ]
  s.files = [
    ".document",
    "CHANGES.txt",
    "Gemfile",
    "Gemfile.lock",
    "LICENSE.txt",
    "README.md",
    "Rakefile",
    "VERSION",
    "json-rpc-objects.gemspec",
    "lib/json-rpc-objects/error.rb",
    "lib/json-rpc-objects/exceptions/invalid-code.rb",
    "lib/json-rpc-objects/generic.rb",
    "lib/json-rpc-objects/generic/error.rb",
    "lib/json-rpc-objects/generic/object.rb",
    "lib/json-rpc-objects/generic/request.rb",
    "lib/json-rpc-objects/generic/response.rb",
    "lib/json-rpc-objects/request.rb",
    "lib/json-rpc-objects/response.rb",
    "lib/json-rpc-objects/serializer.rb",
    "lib/json-rpc-objects/serializer/marshal.rb",
    "lib/json-rpc-objects/serializer/none.rb",
    "lib/json-rpc-objects/utils.rb",
    "lib/json-rpc-objects/utils/hash.rb",
    "lib/json-rpc-objects/utils/object.rb",
    "lib/json-rpc-objects/utils/string.rb",
    "lib/json-rpc-objects/v10/error.rb",
    "lib/json-rpc-objects/v10/request.rb",
    "lib/json-rpc-objects/v10/response.rb",
    "lib/json-rpc-objects/v10/tests/test.rb",
    "lib/json-rpc-objects/v11/alt/error.rb",
    "lib/json-rpc-objects/v11/alt/fakes/request.rb",
    "lib/json-rpc-objects/v11/alt/fakes/response.rb",
    "lib/json-rpc-objects/v11/alt/procedure-call.rb",
    "lib/json-rpc-objects/v11/alt/procedure-parameter-description.rb",
    "lib/json-rpc-objects/v11/alt/procedure-return.rb",
    "lib/json-rpc-objects/v11/alt/request.rb",
    "lib/json-rpc-objects/v11/alt/response.rb",
    "lib/json-rpc-objects/v11/alt/service-description.rb",
    "lib/json-rpc-objects/v11/alt/service-procedure-description.rb",
    "lib/json-rpc-objects/v11/alt/tests/test.rb",
    "lib/json-rpc-objects/v11/generic-types.rb",
    "lib/json-rpc-objects/v11/wd/error.rb",
    "lib/json-rpc-objects/v11/wd/extensions.rb",
    "lib/json-rpc-objects/v11/wd/fakes/request.rb",
    "lib/json-rpc-objects/v11/wd/fakes/response.rb",
    "lib/json-rpc-objects/v11/wd/procedure-call.rb",
    "lib/json-rpc-objects/v11/wd/procedure-parameter-description.rb",
    "lib/json-rpc-objects/v11/wd/procedure-return.rb",
    "lib/json-rpc-objects/v11/wd/request.rb",
    "lib/json-rpc-objects/v11/wd/response.rb",
    "lib/json-rpc-objects/v11/wd/service-description.rb",
    "lib/json-rpc-objects/v11/wd/service-procedure-description.rb",
    "lib/json-rpc-objects/v11/wd/tests/test.rb",
    "lib/json-rpc-objects/v20/error.rb",
    "lib/json-rpc-objects/v20/request.rb",
    "lib/json-rpc-objects/v20/response.rb",
    "lib/json-rpc-objects/v20/tests/test.rb",
    "lib/json-rpc-objects/version.rb",
    "spec/request_spec.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = "http://github.com/martinkozak/json-rpc-objects"
  s.licenses = ["MIT"]
  s.rubygems_version = "2.4.5.1"
  s.summary = "Implementation of JSON-RPC objects with respect to specifications compliance and API backward compatibility. Implements all versions of the protocol and support for ability to communicate by the same protocol version which other side uses by a transparent way."

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<addressable>, [">= 2.2.2"])
      s.add_runtime_dependency(%q<abstract>, [">= 1.0.0"])
      s.add_runtime_dependency(%q<json-rpc-objects-json>, [">= 0.1.1"])
      s.add_runtime_dependency(%q<ruby-version>, [">= 0.4.0"])
      s.add_development_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_development_dependency(%q<jeweler>, [">= 1.5.2"])
      s.add_development_dependency(%q<rspec>, [">= 0"])
      s.add_development_dependency(%q<rspec-its>, [">= 0"])
    else
      s.add_dependency(%q<addressable>, [">= 2.2.2"])
      s.add_dependency(%q<abstract>, [">= 1.0.0"])
      s.add_dependency(%q<json-rpc-objects-json>, [">= 0.1.1"])
      s.add_dependency(%q<ruby-version>, [">= 0.4.0"])
      s.add_dependency(%q<bundler>, [">= 1.0.0"])
      s.add_dependency(%q<jeweler>, [">= 1.5.2"])
      s.add_dependency(%q<rspec>, [">= 0"])
      s.add_dependency(%q<rspec-its>, [">= 0"])
    end
  else
    s.add_dependency(%q<addressable>, [">= 2.2.2"])
    s.add_dependency(%q<abstract>, [">= 1.0.0"])
    s.add_dependency(%q<json-rpc-objects-json>, [">= 0.1.1"])
    s.add_dependency(%q<ruby-version>, [">= 0.4.0"])
    s.add_dependency(%q<bundler>, [">= 1.0.0"])
    s.add_dependency(%q<jeweler>, [">= 1.5.2"])
    s.add_dependency(%q<rspec>, [">= 0"])
    s.add_dependency(%q<rspec-its>, [">= 0"])
  end
end

