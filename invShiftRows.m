function state_in = inv_shift_rows (state_out)
state_in=state_out;
state_in(2,:)=circshift(state_in(2,:),1);
state_in(3,:)=circshift(state_in(3,:),2);
state_in(4,:)=circshift(state_in(4,:),3);


