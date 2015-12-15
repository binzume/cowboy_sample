%% Feel free to use, reuse and abuse the code in this file.

%% @doc sample handler.
-module(sample_hello_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

-define(HEADERS, [{<<"content-type">>, <<"text/plain">>}]).

init(_Transport, Req, []) ->
	{ok, Req, undefined}.

handle(Req, State) ->
	{ok, Req2} = cowboy_req:reply(400, ?HEADERS, <<"Hello, world.">>, Req),
	{ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
	ok.
