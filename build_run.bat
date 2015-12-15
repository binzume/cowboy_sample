rebar get-deps compile
set ERL_LIBS=deps
rebar escript

escript cowboy_sample_escript
