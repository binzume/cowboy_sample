%% coding: utf-8
-module(sample_api_handler_tests).

-include_lib("eunit/include/eunit.hrl").

dummy_test_() ->
    [
     {"常に成功するテスト",
      fun () ->
        ?assertEqual(2, 1 + 1)
      end}
    ].
