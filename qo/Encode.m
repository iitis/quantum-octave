%% -*- texinfo -*-
%% @deftypefn{Function file} {} Encode([@var{size}] )
%% 
%% @end deftypefn
%% @seealso {Id, Not, H, Pase}
%% 

function ret = Encode(state, code)

    flag = -1; % 0-bitflip, 1-phaseflip, 2-shor

    if(nargin~=2)
        usage('Encode(state, bitflip|phaseflip|shor)');
    end

    if(strcmp(code,'bitflip'))
        flag=0;
    elseif(strcmp(code,'phaseflip'))
        flag=1;
    elseif(strcmp(code,'shor'))
        flag=2;
    else
        usage('Encode(state, bitflip|phaseflip|shor)');
    end

    qs = log2(size(state)(2)); % number of qubits in the input state

    if(qs~=1)
        error('State should be density matrix of 1 qubit system')
    end

    if (flag==0) % bitflip
        % encoding gate
        g = Circuit(ControlledGate(3,Not,[1],[2]), 
            ControlledGate(3,Not,[1],[3])); 

        newstate = Kron(state, State(Ket([0,0])));
        ret = Evolve(g, newstate);
    elseif(flag==1) % phaseflip
        % encoding gate
        g = Circuit(ControlledGate(3,Not,[1],[3]), 
          ControlledGate(3,Not,[1],[2]), ProductGate(3,H,[1,2,3])); 
        newstate = Kron(state, State(Ket([0,0])));
        ret = Evolve(g, newstate);
    elseif(flag==2) % shor

        g = Circuit(ControlledGate(9,Not,[1],[4]), 
                ControlledGate(9,Not,[1],[7]), 
                ProductGate(9,H,[1,4,7])
                );

        gc= Circuit(ControlledGate(3,Not,[1],[2]),
                ControlledGate(3,Not,[1],[3])
                ); 
        g = Circuit(g,Kron(gc,gc,gc));
        newstate = Kron(state, State(KetN(0,8)));
        ret = Evolve(g, newstate);
    end

end
