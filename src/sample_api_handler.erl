%% Feel free to use, reuse and abuse the code in this file.

%% @doc sample API handler.
-module(sample_api_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

-define(HEADERS, [{<<"content-type">>, <<"application/json">>}]).

init(_Transport, Req, []) ->
	{ok, Req, undefined}.

handle(Req, State) ->
	{Method, Req2} = cowboy_req:method(Req),
	{Name, Req3} = cowboy_req:qs_val(<<"name">>, Req2),
	{ok, Req4} = execute(Method, Name, Req3),
	{ok, Req4, State}.


execute(<<"GET">>, undefined, Req) ->
	cowboy_req:reply(400, ?HEADERS, jsone:encode(#{status => error, message => <<"Please add '?name=YourName'">>}), Req);
execute(<<"GET">>, Name, Req) ->
	cowboy_req:reply(200, ?HEADERS, jsone:encode(#{status => ok, message => <<"Hello, " ,Name/binary, "!">>}), Req);
execute(_, _, Req) ->
	%% Method not allowed.
	cowboy_req:reply(405, Req).

terminate(_Reason, _Req, _State) ->
	ok.
