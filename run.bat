erl -pa ebin -env ERL_LIBS deps -s reloader -eval "application:ensure_all_started(cowboy_sample)."
