JSON-RPC Objects
================

**JSON-RPC Objects** are implementation of by [JSON-RPC][1] defined 
objects with respect to specifications compliance and API backward 
compatibility. It implements all versions of the protocol and support 
for ability to communicate by the same protocol version which the 
other side uses by a transparent way.

It means, it implements following JSON-RPC versions:

* [1.0][2] (*original specification*)
* [1.1 WD][3] (*working draft*)
* [1.1 Alt][4] (*alternative proposal*)
* [2.0][5] (*revised specification proposal*)

### Protocol Versions Compatibility

All protocols are implemented from points of view of features which must
complain to. Some of these aren't encouraged, but it's on will of the 
user. 2.0 and 1.1 Alt implements some minor additions compared to 
specification such as object extensions as defined in 1.1 WD, but 
mainly because of API compatibility and functionallity reasons.

All classes inherit from previous version so API is homogenous. 
Application which can deal with 1.0 can deal with 2.0 too without any 
funcionallity or logic lost. 

### Usage

All object classes have three creating class methods:

* `#create(<some arguments>, opts = { })` &ndash; which creates new 
object according to arguments (required members) and options (optional 
members),
* `#parse(string)` &ndash; which parses the JSON string,
* `#new(data)` &ndash; which creates new object from hash.

All names of both class names and optional arguments are exactly the 
same as defined in specification.

It can be used by two ways. You know either concrete version of the 
protocol which you want to use in your application (typically client) 
or you process some incoming request which can use whatever of 
the versions (typically server).

Concrete version use example (creates call to `subtract` method with 
ID "a2b3"):

    require "json-rpc-objects/v10/request"
    require "json-rpc-objects/v11/alt/request"
    require "json-rpc-objects/v20/request"
    
    JsonRpcObjects::V10::Request::create(:subtract, ["1", "2"], :id => "a2b3")
    JsonRpcObjects::V11::Alt::Request::create(:subtract, ["1", "2"], :id => "a2b3")
    JsonRpcObjects::V20::Request::create(:subtract, ["1", "2"], :id => "a2b3")
    
Or incoming data processing request:

    require "json-rpc-objects/request"
    JsonRpcObjects::Request::parse(string)
    
…which will simply return request object of appropriate class according 
to its version. Be warn, to distinguish between 1.1 Alt and 1.1 WD is
impossible in most of cases. It isn't problem for simple use, but it 
can be problem in some special cases. Default is WD, but Alt can be set
as default if it's required.

### Transparent Processing

In some cases, for example in case implementing of JSON-RPC server, you 
need make response to request by the same protocol version. It can be 
achieved by simple way:

    require "json-rpc-objects/request"
    
    request = JsonRpcObjects::Request::parse(string)
    ... <data processing>
    response = request.class::version.response::create(<some args>)
    
This code analyzes protocol version of the request and creates response
of the same protocol version. It utilizes call handler, so you can call
for example `request.class::version.service_procedure_description::create(<arguments>)`
for obtaining 1.1 service procedure description object. But be warn 
again, neither 1.0 nor 2.0 implements these objects, so it can simply 
cause `LoadError` in that case therefore it really isn't recommended.

Be limited by `Error`, `Request` and `Response` classes here or check
the protocol version using `#VERSION` class constant. Also note, 
`Request` and `Response` are fake classes for 1.1, and `Error` for 1.0, 
so correspondent 2.0 classes aren't ancestors of these, but of 
`ProcedureCall` and `ProcedureReturn`. This may be subject of change in 
future releases.

Contributing
------------

1. Fork it.
2. Create a branch (`git checkout -b 20101220-my-change`).
3. Commit your changes (`git commit -am "Added something"`).
4. Push to the branch (`git push origin 20101220-my-change`).
5. Create an [Issue][6] with a link to your branch.
6. Enjoy a refreshing Diet Coke and wait.


Copyright
---------

Copyright &copy; 2011 [Martin Kozák][7]. See `LICENSE.txt` for
further details.

[1]: http://en.wikipedia.org/wiki/JSON-RPC
[2]: http://json-rpc.org/wiki/specification
[3]: http://json-rpc.org/wd/JSON-RPC-1-1-WD-20060807.html
[4]: http://groups.google.com/group/json-rpc/web/json-rpc-1-1-alt
[5]: http://groups.google.com/group/json-rpc/web/json-rpc-2-0
[6]: http://github.com/martinkozak/json-rpc-objects/issues
[7]: http://www.martinkozak.net/