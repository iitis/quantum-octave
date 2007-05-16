%% -*- texinfo -*-
%% @deftypefn {Function file} {} Observable(obs)
%% Function @code{Observable} returns spectral measure 
%% for given 1 qubit observabvle
%% 
%% @example 
%%
%% @end deftypefn
%%
%% @seealso {Id, Not}
%%

function ret = Observable(obs, str)
%
% TODO check if obs is hermietian and of size 2x2
%
flag = -1; % 0 - vec, 1 - proj
if(nargin==1)
	flag = 1;
elseif (nargin == 2)
	if (strcmp(str,'vec'))
		flag=0;
	elseif(strcmp(str,'proj'))
		flag=1;	
	else
		usage('Observable(obs[, {proj|vec}])');
    end
end

[V,l]=eig(obs);

ret(1).l = l(1,1);
ret(2).l = l(2,2);

if(flag==1)
	ret(1).proj = V(:,1)*V(:,1)';
	ret(2).proj = V(:,2)*V(:,2)';
elseif(flag==0)
	ret(1).vec = V(:,1);
	ret(2).vec = V(:,2);
else
	error('Proble with input parameters!')
end

end
