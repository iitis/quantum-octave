%% -*- texinfo -*-
%% @deftypefn {Function file} {} Commutator (@var{mtx1}, @var{mtx2})
%% For two given matrices this function return their comutator.
%% 
%% @example 
%% @group
%% Commutator (Id, H)
%%  @result{} 
%%	0	0
%%	0	0
%% @end group
%% @end example
%%
%% @end deftypefn
%%
%% @seealso {Id, H, Not}
%%

function ret = Commutator(A,B)

if (nargin~=2)
    usage ('Commutator (mtx_1, mtx_2)');
end

if(size(A)~=size(B))
    error('Matrices are of different sizes!');
end
	ret=A*B-B*A;
end
