%% -*- texinfo -*-
%% @deftypefn {Function file} {} RotX(@var{real})
%% Function @code{RotX} returns 2x2 matrix, that is
%% 
%% @example 
%% @group
%% RotX(pi/2)
%%  @result{} 
%% 0.70711 + 0.00000i  0.00000 - 0.70711i
%% 0.00000 - 0.70711i  0.70711 + 0.00000i
%% @end group
%% @end example
%%
%% @end deftypefn
%% 

function ret = RotX(th)
    ret = [cos(th/2),-i*sin(th/2);-i*sin(th/2),cos(th/2)];
end
