# HTTP Status Codes
## 1xx informal response
* **100 Continue**: server received the request headers and the client should proceed to send the request body
* **101 Switching Protocols**: requester asked the server to switch protocols and the server agreed
* **102 Processing**: server received and is processing the request, but no response is available yet
* **103 Early Hints**: used to return some response headers before the final HTTP message

## 2xx success
* **200 OK**: successful HTTP request
* **201 Created**: request has been fulfilled, resulting in the creation of a new resource
* **202 Accepted**: request accepted for processing but has not been completed
* **203 Nonauthoritative Information**: server is a transforming proxy that received a 200 OK from its origin but is returning a modified version of the response
* **204 No Content**: request processed and is not returning any content
* **205 Reset Content**: request processed, asks the requester to reset its document view and is not returning any content
* **206 Partial Content**: server is delivering only a part of the resource due to a range header of the client
* **207 Multi-Status**: message body is by default an XML message and can contain a number of separate response codes
* **208 Already Reported**: members of a DAV binding have already been enumerated and are not being included again
* **226 IM Used**: response is a representation of the result of one or more instance-manipulators applied to the current instance

## 3xx redirection
* **300 Multiple Choices**: multiple options, e.g. multiple video format options
* **301 Moved Permanently**: this and all future requests should be directed to the given URI
* **302 Found**: tells the client to look at (browse to) another URL
* **303 See Other**: response can be found under another URI using the GET method
* **304 Not Modified**: resource has not been modified since the version specified by the request headers If-Modified-Since or If-None-Match
* **305 Use Proxy**: resource is only available through a proxy, the address for which is provided in the response
* **306 Switch Proxy**: no longer used, meant: subsequent requests should use the specified proxy
* **307 Temporary Redirect**: request should be repeated with another URI, future requests should not
* **308 Permanent Redirect**: request and all future requests should be repeated with another URI

## 4xx client errors
* **400 Bad Request**: server cannot or will not process the request due to an client error
* **401 Unauthorized**: authentication required
* **402 Payment Required**: reserved for future use, original intention: digital cash scheme
* **403 Forbidden**: request valid and understood but refused by server
* **404 Not Found**: resource could not be found
* **405 Method Not Allowed**: request method is not supported for the resource
* **406 Not Acceptable**: only content that is not acceptable to the Accept headers
* **407 Proxy Authentication Required**: client has to authenticate on the proxy
* **408 Request Timeout**: server timed out waiting for the request
* **409 Conflict**: conflict in current state of the resource
* **410 Gone**: resource not available and will not be available again
* **411 Length Required**: request did not specify the length of its content
* **412 Precondition Failed**: server does not meet precondition the requester specified in header
* **413 Payload Too Large**: request is larger than the server is willing or able to process
* **414 URI Too Long**: URI was too long for the server to process
* **415 Unsupported Media Type**: request has media type which the server does not support
* **416 Range Not Satisfiable**: server cannot supply requested portion of a file, e.g. beyond end of file
* **417 Expectation Failed**: server cannot meet the requirements of the Expect request-header field
* **418 I'm A Teapot**: easteregg
* **421 Misdirected Request**: sent to a server which is not able to produce a response
* **422 Unprocessable Entity**: unable to be followed due to semantic errors
* **423 Locked**: resource is locked
* **424 Failed Dependency**: dependent on other request which failed
* **425 Too Early**: server is unwilling to risk processing a request that might be replayed
* **426 Upgrade Required**: client should switch to a different protocol such as TLS/1.0 given in the Upgrade header field
* **428 Precondition Required**: request has to be conditional, intended to prevent the 'lost update' problem
* **429 Too Many Requests**: user sent too many requests in a given amount of time
* **431 Request Header Fields Too Large**: one or more header fields ar too large
* **451 Unavailable For Legal Reasons**: server received legal demand to deny access

## 5xx server errors
* **500 Internal Server Error**: generic error message
* **501 Not Implemented**: server lacks ability to fulfill the request
* **502 Bad Gateway**: server was acting as a gateway and received an invalid response
* **503 Service Unavailable**: server is overloaded or down for maintenance, usually temporary
* **504 Gateway Timeout**: server was acting as a gateway and received a timeout
* **505 HTTP Version Not Supported**: server does not support the HTTP protocol version
* **506 Variant Also Negotiates**: conent negotiation results in a circual reference
* **507 Insufficient Storage**: server unable to store the representation needed to complete
* **508 Loop Detected**: infinite loop
* **510 Not Extended**: further extensions are required
* **511 Network Authentication Required**: client needs to authenticate
