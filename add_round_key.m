function state_out = add_round_key (state_in, round_key)
%  Add (XOR) the round key to the state.
state_out = bitxor (state_in, round_key);