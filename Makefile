all: compile eunit dialyze escriptize

compile:
	@./rebar compile

start: compile
	erl -pa ebin -env ERL_LIBS deps -s reloader -eval "application:ensure_all_started(cowboy_sample)."

dialyze: compile
	dialyzer

eunit:
	@./rebar eunit

escriptize:
	@./rebar escriptize

clean:
	@./rebar clean

