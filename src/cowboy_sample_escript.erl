%% module for rebar escriptize
-module(cowboy_sample_escript).

%%----------------------------------------------------------------------------------------------------------------------
%% Exported API
%%----------------------------------------------------------------------------------------------------------------------
-export([
         main/1
        ]).

%%----------------------------------------------------------------------------------------------------------------------
%% Exported Functions
%%----------------------------------------------------------------------------------------------------------------------

-spec main([string()]) -> no_return().
main(_Args) ->
    {ok, _} = application:ensure_all_started(cowboy_sample),
    timer:sleep(infinity).
